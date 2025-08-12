REPO=https://github.com/ErnstBecker/dotfiles.git
WPP_REPO=https://github.com/ErnstBecker/wallpapers.git
DIR=$(HOME)/dotfiles
WALLPAPER_DIR=$(HOME)/Pictures/wallpapers

sync:
	cd $(DIR) && git pull

get_wpp get-wpp:
	git clone $(WPP_REPO) $(WALLPAPER_DIR)

sync_wpp sync-wpp:
	cd $(WALLPAPER_DIR) && git pull

add_wpp add-wpp:
	cd $(WALLPAPER_DIR) && git add . && git commit -m ":sparkles: Add new Wallpaper(s)" && git push

rm_wpp rm-wpp:
	cd $(WALLPAPER_DIR) && git add . && git commit -m ":fire: Remove Wallpaper(s)" && git push

config-vencord:
	sh -c "$$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
