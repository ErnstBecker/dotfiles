#! /bin/sh
trap "exit 1" INT

pacman_i() {
	sudo pacman -S "$@"
}

enable_service() {
	systemctl enable "$@"
}

printf "Choose your package manager? (paru or yay): "
read pkg_mng
if [ "$pkg_mng" != "paru" ] && [ "$pkg_mng" != "yay" ]; then
	echo "Invalid option."
	exit 1
fi

pacman_i hyprland ly zsh git rofi bluez bluez-utils xdg-user-dirs
xdg-user-dirs-update
chsh -s /bin/zsh

valid_file_mng="nautilus nemo thunar dolphin yazi ranger"
printf "Choose your file managers (space-separated)\n"
printf "Possible options ($valid_file_mng):\n"
read file_mng

for choice in $file_mng; do
	ok=false
	for i in $valid_file_mng; do
		[ "$choice" = "$i" ] && ok=true
	done
	if [ "$ok" = false ]; then
		echo "Invalid option(s): $choice"
		exit 1
	fi
done

pacman_i $file_mng

# Shell tools
$pkg_mng -S grep tree less fzf starship --noconfirm

# Alternatives
$pkg_mng -S zoxide lsd bat diff-so-fancy --noconfirm

# TUI programs
$pkg_mng -S btop fastfetch

# Programming specific
$pkg_mng -S asdf-vm neovim

# Fonts and themes
$pkg_mng -S inter-font noto-fonts-cjk noto-fonts-emoji noto-fonts ttf-cascadia-code-nerd ttf-firacode-nerd ttf-nerd-fonts-symbols --noconfirm

# Install Rust
printf "Install Rust? (y)es/(n)o: "
read rust_res
case "${rust_res,,}" in
	y|yes)
		pacman_i rustup
		rustup default stable
		rustup component add rust-analyzer
		;;
	n|no)
		;;
	*)
		echo "Skipping."
		;;
esac

# Enable services
services="ly bluetooth"
for s in $services; do
	enable_service "$s"
done
