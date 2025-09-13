#! /bin/zsh

# ? Get the package manager of your choice (paru or yay) and install the packages
read "package_manager? Choose your package manager? (Enter 'paru' or 'yay'): "

if [[ "$package_manager" != "paru" && "$package_manager" != "yay" ]]; then
	echo "Invalid option."
	exit 1
fi

# ! Fonts
$package_manager -S inter-font noto-fonts-cjk noto-fonts-emoji noto-fonts ttf-cascadia-code-nerd ttf-firacode-nerd ttf-nerd-fonts-symbols

# ! Zsh
$package_manager -S zsh zoxide lsd bat oh-my-posh-bin fzf

# ! TUI & CLI
$package_manager -S neovim btop yazi fastfetch