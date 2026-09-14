-- █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█
-- █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█

hl.on("hyprland.start", function ()
	hl.exec_cmd("quickshell")
	hl.exec_cmd("docker compose -f ~/dotfiles/modules/secrets/docker-compose.yml up -d")
end)
