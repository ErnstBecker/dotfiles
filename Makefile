MAKEFLAGS += --silent

DOT=https://github.com/ErnstBecker/dotfiles.git
DOT_SECRETS=git@github.com:ErnstBecker/secrets.git
DOT_PAPERS=https://github.com/ErnstBecker/dotpapers.git

DIR=$(HOME)/dotfiles
MODULES_DIR=$(DIR)/modules
SECRETS_DIR=$(MODULES_DIR)/secrets
WALLPAPERS_DIR=$(HOME)/Pictures/wallpapers

.PHONY: get-secrets get-wallpapers get-vencord

get-secrets:
	git clone $(DOT_SECRETS) $(SECRETS_DIR)
	cd $(SECRETS_DIR) && stow -t ~ . --adopt

get-wallpapers:
	git clone $(DOT_PAPERS) $(WALLPAPERS_DIR)

get-vencord:
	sh -c "$$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
