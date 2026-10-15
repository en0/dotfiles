#!/bin/env python3

import re
import os
import os.path
import pathlib
from argparse import ArgumentParser
from typing import Callable, NamedTuple


DOTFILES_ROOT = pathlib.Path(os.path.dirname(__file__))
HOME_ROOT = pathlib.Path(os.path.expanduser("~"))
DIRS = {
    DOTFILES_ROOT / "bin": HOME_ROOT / ".bin",
    DOTFILES_ROOT / "config": HOME_ROOT / ".config",
    DOTFILES_ROOT / "env": HOME_ROOT / ".env.d",
    DOTFILES_ROOT / "wallpaper": HOME_ROOT / "Pictures/wallpaper",
}


class Opts(NamedTuple):
    cleanup: bool
    dry_run: bool
    filter: PathFilter


class PathFilter:

    def __init__(self, value: str):
        value = pathlib.Path(os.path.expanduser(value)).resolve()
        self.raw = str(value)
        if self.raw.endswith(os.path.sep):
            self.path = value
            self.re = None
        else:
            self.path = pathlib.Path(os.path.sep.join(value.parts[:-1])).resolve()
            self.re = re.compile(re.escape(str(self.path)) + os.path.sep + value.parts[-1])

    def check(self, target: str):
        target = pathlib.Path(target)
        return any([
            self.path.is_relative_to(target),
            self.re.fullmatch(str(target)) is not None if self.re else False
        ])

    def __repr__(self):
        return f'<PathFilter(raw="{self.raw}",path="{self.path}")>'

def get_opts() -> Opts:
    ap = ArgumentParser()
    ap.add_argument(
        "-d",
        action="store_true",
        default=False,
        help="Enable dead-symlink cleanup."
    )
    ap.add_argument(
        "-n",
        action="store_true",
        default=False,
        help="Preform a dry-run."
    )
    ap.add_argument(
        "-f",
        type=PathFilter,
        default=None,
        help="Filter install to given path.example: '~/.bin/*', '~/.bin/foo'"
    )
    opts = ap.parse_args()
    return Opts(
        cleanup=opts.d,
        dry_run=opts.n,
        filter=opts.f
    )


def maybe_do(
    is_dry_run: bool,
    msg: str,
    cmd: Callable[[], None]
):
    if is_dry_run:
        print("Would run:", msg)
    else:
        print(msg)
        cmd()


def install_files(dry_run: bool, filt: PathFilter):
    for source, target in DIRS.items():

        if not target.exists() and filt.check(target):
            maybe_do(dry_run, f"mkdir {target}", lambda: target.mkdir())

        i = len(source.parts)
        for s, folders, files in os.walk(source):
            s = pathlib.Path(s)
            p = target / pathlib.Path(*s.parts[i:])

            for d in folders:
                if not filt.check(p/d): continue
                if not (p / d).exists():
                    maybe_do(dry_run, f"mkdir {p/d}", lambda: (p/d).mkdir())

            for f in files:
                if not filt.check(p/f): continue
                if not (p / f).exists():
                    maybe_do(dry_run, f"ln {s/f} {p/f}", lambda: os.symlink(s/f, p/f))

                elif not (p / f).is_symlink():
                    if dry_run:
                        print("WARNING!", "Target file already exists at", p/f)
                    else:
                        print("WARNING!", "Refusing to overwrite", p/f)


def cleanup_dead_files(dry_run: bool, filt: PathFilter):
    for _, target in DIRS.items():
        for root, _, files in os.walk(target):
            for f in files:
                t = pathlib.Path(root)
                if (t/f).is_symlink() and not (t/f).resolve().exists() and filt.check(t/f):
                    maybe_do(dry_run, f"unlink {t/f}", lambda:(t/f).unlink())


if __name__ == "__main__":
    opts = get_opts()
    install_files(opts.dry_run, opts.filter)
    if opts.cleanup:
        cleanup_dead_files(opts.dry_run, opts.filter)
