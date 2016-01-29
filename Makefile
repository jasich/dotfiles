DOTFILE_NAMES := .gitconfig-core .gitconfig-diff .gitconfig-aliases .gitignore_global

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
DOTFILE_PATHS := $(DOTFILE_NAMES:%=$(ROOT_DIR)/%)
BACKUP_PREFIX := $(ROOT_DIR)/.backup
BACKUP_DIR := $(BACKUP_PREFIX)-$(shell date +"%s")
FLAG_PATH := $(ROOT_DIR)/.flag

.PHONY: all
all: links

.PHONY: links
links: $(FLAG_PATH)
$(FLAG_PATH): $(DOTFILE_PATHS) Makefile
	mkdir -p $(BACKUP_DIR)
	for file in $(DOTFILE_NAMES) ; do \
		mv ~/$$file $(BACKUP_DIR)/ ; \
		ln -s $(ROOT_DIR)/$$file ~/$$file ; \
	done
	# TODO: copy and example .gitconfig if one does not exist
	# Or, append the include block into their existing .gitconfig if needed
	#cp .gitconfig-example ~/.gitconfig
	touch $(FLAG_PATH)

.PHONY: clean
clean:
	rm -rf $(FLAG_PATH)

.PHONY: clean-all
clean-all: clean
	rm -rf $(BACKUP_PREFIX)*
