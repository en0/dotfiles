DOTFILES_DIR := $(shell pwd)

# Discover all subdirectories within the 'config' directory
CONFIG_SUBDIRS := $(wildcard $(DOTFILES_DIR)/config/*)

# Extract the names of the discovered subdirectories (without the full path)
CONFIG_DIRS := $(notdir $(CONFIG_SUBDIRS))

.PHONY: install config bin env

install: config bin env
    @echo "Dotfiles installation completed!"
    @echo ""
    @echo "Don't forget to add the following to your .bashrc or .zshrc:"
    @echo "[ -d \"$$HOME/.env.d\" ] && for f in $$HOME/.env.d/*; do source $$f; done"

config: $(addprefix $(HOME)/.config/,$(CONFIG_DIRS))

$(HOME)/.config/%: config/%
    @echo "Installing $<..."
    @ln -sf $(abspath $<) $@

bin:
    @echo "Installing bin directory..."
    @ln -sf $(DOTFILES_DIR)/bin $(HOME)/.bin

env:
    @echo "Installing env directory..."
    @ln -sf $(DOTFILES_DIR)/env $(HOME)/.env.d
