DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy:
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(join(".", $(val)));)

help:
	@echo "deploy  => Create symlinks to home directory."
	@echo "update  => Fetch all changes from remote repo."
	@echo "install => Run update, deploy, init"
	@echo "clean   => remove the dotfiles"

clean:
	@echo 'Remove dot files from your home directory.'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

