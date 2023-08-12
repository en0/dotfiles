DOTFILES_DIR := $(shell pwd)

# Target directories
CONFIG_TARGET_DIR := $(HOME)/.config
BIN_TARGET_DIR := $(HOME)/.bin
ENV_TARGET_DIR := $(HOME)/.env.d

# Discover all leaf files in config, bin, and env directories
CONFIG_LEAF_FILES := $(shell find $(DOTFILES_DIR)/config -type f)
BIN_LEAF_FILES := $(shell find $(DOTFILES_DIR)/bin -type f)
ENV_LEAF_FILES := $(shell find $(DOTFILES_DIR)/env -type f)

# Read exclude files
CONFIG_EXCLUDE_FILE := $(CONFIG_TARGET_DIR)/exclude
BIN_EXCLUDE_FILE := $(BIN_TARGET_DIR)/exclude
ENV_EXCLUDE_FILE := $(ENV_TARGET_DIR)/exclude
CONFIG_EXCLUDES := $(wildcard $(CONFIG_EXCLUDE_FILE))
BIN_EXCLUDES := $(wildcard $(BIN_EXCLUDE_FILE))
ENV_EXCLUDES := $(wildcard $(ENV_EXCLUDE_FILE))

# Filter out excluded files
CONFIG_FILTERED := $(filter-out $(CONFIG_EXCLUDES), $(CONFIG_LEAF_FILES))
BIN_FILTERED := $(filter-out $(BIN_EXCLUDES), $(BIN_LEAF_FILES))
ENV_FILTERED := $(filter-out $(ENV_EXCLUDES), $(ENV_LEAF_FILES))

# Each folder type does the same thing
define create_link
	relative_path=$$(echo $(1) | sed 's|$(DOTFILES_DIR)/$(2)||'); \
	target_path=$(3)$$relative_path; \
	target_dir=$$(dirname $$target_path); \
	echo "Installing $${target_path}..."; \
	mkdir -p $$target_dir; \
	ln -sf $(1) $$target_path;
endef

.PHONY: install config bin env

install: config bin env
	@echo "Dotfiles installation completed!"
	@echo ""
	@echo "Don't forget to add the following to your .bashrc or .zshrc:"
	@echo "[ -d \"$$HOME/.env.d\" ] && for f in $$HOME/.env.d/*; do source $$f; done"

config: $(CONFIG_FILTERED)
	@for file in $^; do \
		$(call create_link,$$file,config,$(CONFIG_TARGET_DIR)) \
	done

bin: $(BIN_FILTERED)
	@for file in $^; do \
		$(call create_link,$$file,bin,$(BIN_TARGET_DIR)) \
	done

env: $(ENV_FILTERED)
	@for file in $^; do \
		$(call create_link,$$file,env,$(ENV_TARGET_DIR)) \
	done
