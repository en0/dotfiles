# Dotfiles

This repository contains my personal dotfiles, which are configuration files for
various programs and tools used in my development environment.

## Installation

To install these dotfiles on your system, follow the steps below:

1. Clone the repository:

```bash
git clone git@github.com:en0/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run the installation script:

```bash
make install
```

The installation script will create symbolic links from the dotfiles in this
repository to their respective locations in your home directory.

3. Put the following line in your `.bashrc` or `.zshrc` file.

```bash
[ -d "$HOME/.env.d" ] && for f in $HOME/.env.d/*.env; do source $f; done
```

This line will activate the files in `$HOME/.env.d` each time your shell is
started.

## Included Dotfiles

### Configuration Files

The **config** directory contains various configuration files that should be placed
in the `~/.config` directory.

### Bin Directory

The **bin** directory contains custom scripts and executables that will be linked to
the `~/.bin` directory.

### Environment Directory

The **env** directory contains environment-related files that will be linked to
the `~/.env.d` directory.

## Exclusions

You can use an `exclude` file to prevent specific files or folders from being
installed on a particular system. Exclude files provide a way to fine-tune the
installation process based on your needs.

### Config Exclusion

If you want to exclude certain configuration files or folders from being
installed in the `~/.config` directory, you can create an `exclude` file in the
`~/.config` directory. List the names of the files or folders you wish to
exclude, one per line.

**~/.config/exclude:**

```plaintext
config/some-config-file
config/excluded-folder
```

### Bin Exclusion

For excluding custom scripts or executables from being installed in the `~/.bin`
directory, create an exclude file in the `~/.bin` directory and list the items you
want to exclude, one per line.

**~/.bin/exclude:**

```plaintext
bin/some-script
bin/excluded-executable
```

### Environment Exclusion

To exclude specific environment files from being installed in the `~/.env.d`
directory, create an exclude file in the `~/.env.d` directory and list the
environment files you wish to exclude, one per line.

**~/.env.d/exclude:**

```plaintext
env/some-environment-file.env
env/excluded-env-file.env
```

## Updating Dotfiles

To update the dotfiles in this repository:

- Make changes to the dotfiles in this repository.
- Commit the changes and push them to the remote repository (if applicable).
- On each machine where you want to update the dotfiles, pull the changes and
  re-run the installation script.

```bash
cd ~/.dotfiles
git pull origin main
make install
```

# Related

Consider the following releated repositories.

- [Neovim](https://github.com/neovim/neovim/releases/)
- [TPM](https://github.com/tmux-plugins/tpm)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [zPrezto](https://github.com/en0/prezto/tree/master)
- [NVM](https://github.com/nvm-sh/nvm)
