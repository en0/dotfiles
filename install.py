#!/bin/env python3

import os
import os.path
import pathlib


DOTFILES_ROOT = pathlib.Path(os.path.dirname(__file__))
HOME_ROOT = pathlib.Path(os.path.expanduser("~"))
DIRS = {
    DOTFILES_ROOT / "bin": HOME_ROOT / ".bin",
    DOTFILES_ROOT / "config": HOME_ROOT / ".config",
    DOTFILES_ROOT / "dwm": HOME_ROOT / ".dwm",
    #DOTFILES_ROOT / "env": HOME_ROOT / ".env.d",
}


def install_files():
    for source, target in DIRS.items():
        if not target.exists():
            target.mkdir()
        i = len(source.parts)
        for s, folders, files in os.walk(source):
            s = pathlib.Path(s)
            p = target / pathlib.Path(*s.parts[i:])

            for d in folders:
                if not (p / d).exists():
                    print("mkdir", p / d)
                    (p / d).mkdir()

            for f in files:
                if not (p / f).exists():
                    print("ln", s/f, p/f)
                    os.symlink(s/f, p/f)
                elif not (p / f).is_symlink():
                    print("WARNING!", "Refusing to overwrite", p/f)


if __name__ == "__main__":
    install_files()
