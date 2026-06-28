-- █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█
-- █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█

hl.on("hyprland.start", function ()
	-- Audio
	-- hl.exec_cmd("pipewire")
	-- hl.exec_cmd("pipewire-pulse")
	-- hl.exec_cmd("wireplumber")

	-- Start up services
	hl.exec_cmd("quickshell")
	hl.exec_cmd("docker compose -f ~/dotfiles/modules/secrets/docker-compose.yml up -d")
end)
