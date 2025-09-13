MAKEFLAGS += --silent

DOT=https://github.com/ErnstBecker/dotfiles.git
DOT_SECRETS=git@github.com:ErnstBecker/dotsecrets.git
DOT_PAPERS=https://github.com/ErnstBecker/dotpapers.git

DIR=$(HOME)/dotfiles
MODULES_DIR=$(DIR)/modules
SECRETS_DIR=$(MODULES_DIR)/dotsecrets
WALLPAPERS_DIR=$(HOME)/Pictures/wallpapers

.PHONY: sync get-secrets get-wallpapers get-vencord stow-secrets

sync:
	cd $(DIR) && git pull

get-secrets:
	git clone $(DOT_SECRETS) $(SECRETS_DIR)
	$(MAKE) stow-secrets

get-wallpapers:
	git clone $(DOT_PAPERS) $(WALLPAPERS_DIR)

get-vencord:
	sh -c "$$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

stow-secrets:
	cd $(SECRETS_DIR) && stow -t ~ . --adopt
