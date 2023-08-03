# NeoVim setup

In addition to installing the configuration files, you will need to do a few
other things.

1. Install [NeoVim](https://github.com/neovim/neovim/releases/).
2. Install [vim-plug](https://github.com/junegunn/vim-plug).
3. Install [NVM](https://github.com/nvm-sh/nvm).
4. Create a Python Environment.

## NeoVim

Grab the lastest stable version from the release page. I generally use the
appimage. If you use the appimage, you will need to install `fuse` on your
system.

## vim-plug

Follow the installation instructions on the github page. You might need to
install `curl` on your system.

## NVM

Follow the installation instructions on the github page. You might need to
install `curl` on your system.

## Python Environment

Install the requirements listed in requirements.txt. You might need to install
`python3-venv` on your system.

```bash
cd config/nvim
python3 -m venv venv
./venv/bin/pip install -r requirements.txt
```
