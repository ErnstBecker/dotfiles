WALLPAPER_DIR=~/Pictures/wallpapers
REPO=https://github.com/ErnstBecker/wallpapers.git

get get-wallpapers:
	git clone $(REPO) $(WALLPAPER_DIR)

sync sync-wallpapers:
	cd $(WALLPAPER_DIR) && git pull

add add-wallpaper:
	cd $(WALLPAPER_DRI) && git add . && git commit -m ":sparkles: Add new Wallpaper(s)" && git push

rm remove remove-wallpaper:
	cd $(WALLPAPER_DIR) && git add . && git commit -m ":fire: Remove Wallpaper(s)" && git push
