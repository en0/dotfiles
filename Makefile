DOTFILES_DIR := $(shell pwd)

# The target dir
TARGET_ROOT := $(HOME)/testing

# Discover all files in config
CONFIG_TARGET_DIR := $(TARGET_ROOT)/.config
CONFIG_EXCLUDE_FILE := $(CONFIG_TARGET_DIR)/exclude
CONFIG_FILES := $(shell find $(DOTFILES_DIR)/config -type f)
ifeq ($(wildcard $(CONFIG_EXCLUDE_FILE)), $(CONFIG_EXCLUDE_FILE))
	CONFIG_EXCLUDE_OBJ := $(shell cat $(CONFIG_EXCLUDE_FILE))
	CONFIG_FILES := $(filter-out $(CONFIG_EXCLUDE_OBJ), $(CONFIG_FILES))
endif

# Discover all files in bin
BIN_TARGET_DIR := $(TARGET_ROOT)/.bin
BIN_EXCLUDE_FILE := $(BIN_TARGET_DIR)/exclude
BIN_FILES := $(shell find $(DOTFILES_DIR)/bin -type f)
ifeq ($(wildcard $(BIN_EXCLUDE_FILE)), $(BIN_EXCLUDE_FILE))
	BIN_EXCLUDE_OBJ := $(shell cat $(BIN_EXCLUDE_FILE))
	BIN_FILES := $(filter-out $(BIN_EXCLUDE_OBJ), $(BIN_FILES))
endif

# Discover all files in env
ENV_TARGET_DIR := $(TARGET_ROOT)/.env.d
ENV_EXCLUDE_FILE := $(ENV_TARGET_DIR)/exclude
ENV_FILES := $(shell find $(DOTFILES_DIR)/env -type f)
ifeq ($(wildcard $(ENV_EXCLUDE_FILE)), $(ENV_EXCLUDE_FILE))
	ENV_EXCLUDE_OBJ := $(shell cat $(ENV_EXCLUDE_FILE))
	ENV_FILES := $(filter-out $(ENV_EXCLUDE_OBJ), $(ENV_FILES))
endif

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

config: $(CONFIG_FILES)
	@for file in $^; do \
		$(call create_link,$$file,config,$(CONFIG_TARGET_DIR)) \
	done

bin: $(BIN_FILES)
	@for file in $^; do \
		$(call create_link,$$file,bin,$(BIN_TARGET_DIR)) \
	done

env: $(ENV_FILES)
	@for file in $^; do \
		$(call create_link,$$file,env,$(ENV_TARGET_DIR)) \
	done
