DOTFILES_DIR := $(shell pwd)

# Discover all files/folders to link in each directory: config, env, bin.
# Look for an exclude file in the target folder and filter out the files/folders
# from the object list. Else, install them all.

CONFIGS := $(wildcard $(DOTFILES_DIR)/config/*)
CONFIG_OBJ := $(notdir $(CONFIGS))
CONFIG_EXCLUDE_FILE := $(HOME)/.config/exclude
ifeq ($(wildcard $(CONFIG_EXCLUDE_FILE)), $(CONFIG_EXCLUDE_FILE))
	CONFIG_EXCLUDE_OBJ := $(shell cat $(CONFIG_EXCLUDE_FILE))
	CONFIG_OBJ := $(filter-out $(CONFIG_EXCLUDE_OBJ), $(CONFIG_OBJ))
endif

BINS := $(wildcard $(DOTFILES_DIR)/bin/*)
BIN_OBJ := $(notdir $(BINS))
BIN_EXCLUDE_FILE := $(HOME)/.bin/exclude
ifeq ($(wildcard $(BIN_EXCLUDE_FILE)), $(BIN_EXCLUDE_FILE))
	BIN_EXCLUDE_OBJ := $(shell cat $(BIN_EXCLUDE_FILE))
	BIN_OBJ := $(filter-out $(BIN_EXCLUDE_OBJ), $(BIN_OBJ))
endif

ENVS := $(wildcard $(DOTFILES_DIR)/env/*)
ENV_OBJ := $(notdir $(ENVS))
ENV_EXCLUDE_FILE := $(HOME)/.env.d/exclude
ifeq ($(wildcard $(ENV_EXCLUDE_FILE)), $(ENV_EXCLUDE_FILE))
	ENV_EXCLUDE_OBJ := $(shell cat $(ENV_EXCLUDE_FILE))
	ENV_OBJ := $(filter-out $(ENV_EXCLUDE_OBJ), $(ENV_OBJ))
endif

.PHONY: install config bin env

install: config bin env
	@echo "Dotfiles installation completed!"
	@echo ""
	@echo "Don't forget to add the following to your .bashrc or .zshrc:"
	@echo "[ -d \"$$HOME/.env.d\" ] && for f in $$HOME/.env.d/*; do source $$f; done"

config: $(addprefix $(HOME)/.config/,$(CONFIG_OBJ))
$(HOME)/.config/%: config/% $(HOME)/.config
	@echo "Installing $<..."
	@ln -sf $(abspath $<) $@
$(HOME)/.config:
	@echo "Creating dir: $@..."
	@mkdir $@

bin: $(addprefix $(HOME)/.bin/,$(BIN_OBJ))
$(HOME)/.bin/%: bin/% $(HOME)/.bin
	@echo "Installing $<..."
	@ln -sf $(abspath $<) $@
$(HOME)/.bin:
	@echo "Creating dir: $@..."
	@mkdir $@

env: $(addprefix $(HOME)/.env.d/,$(ENV_OBJ))
$(HOME)/.env.d/%: env/% $(HOME)/.env.d
	@echo "Installing $<..."
	@ln -sf $(abspath $<) $@
$(HOME)/.env.d:
	@echo "Creating dir: $@..."
	@mkdir $@
