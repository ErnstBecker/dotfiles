-- █▄▀  █▀▀  █░█  █▀▄  █  █▄░█  █▀▄  █▀▀
-- █▀▄  ██▄   █   ██▀  █  █░▀█  █▄▀  ▄▄█


-- ================== --
-- █░█  ▄▀█  █▀▄  █▀▀ --
-- ▀▄▀  █▀█  █▀▄  ▄▄█ --
-- ================== --
local mainMod     = "SUPER"
local mainScripts = os.getenv("HOME") .. "/.local/bin"
local terminal    = "kitty"
local browser     = "zen"
local files       = "thunar"
local music       = "spotify"
local menu        = mainScripts .. "/run_rofi.sh"


-- ======================================== --
-- █▀█  █▀▄  █▀█  █▀▀  █▀▄  ▄▀█  █▄ ▄█  █▀▀ --
-- █▀▀  █▀▄  █▄█  █▄█  █▀▄  █▀█  █░▀░█  ▄▄█ --
-- ======================================== --
hl.bind(mainMod .. " + T",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",     hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + F",     hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + M",     hl.dsp.exec_cmd(music))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))


-- ==================================== --
-- █░▄░█  █  █▄░█  █▀▄  █▀█  █░▄░█  █▀▀ --
-- █▀ ▀█  █  █░▀█  █▄▀  █▄█  █▀ ▀█  ▄▄█ --
-- ==================================== --
hl.bind("ALT + F4",           hl.dsp.window.kill())
hl.bind(mainMod .. " + Q",    hl.dsp.window.close())
hl.bind(mainMod .. " + C",    hl.dsp.exec_cmd(mainScripts .. "/resize_window.sh"))
hl.bind(mainMod .. " + HOME", hl.dsp.exit())
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })

-- Window resize / focus movement (Vim-style)
local vimDirs = {
	{ key = "H", x = -100, y =    0, dir = "left"  },
	{ key = "L", x =  100, y =    0, dir = "right" },
	{ key = "K", x =    0, y = -100, dir = "up"    },
	{ key = "J", x =    0, y =  100, dir = "down"  },
}
for _, d in ipairs(vimDirs) do
	hl.bind(mainMod .. " + ALT + "  .. d.key, hl.dsp.window.resize({ x = d.x, y = d.y, relative = true }))
	hl.bind(mainMod .. " + CTRL + " .. d.key, hl.dsp.focus({ direction = d.dir }))
end
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- ============================================== --
-- █▄░█  ▄▀█  █░█  █  █▀▀  ▄▀█  ▀█▀  █  █▀█  █▄░█ --
-- █░▀█  █▀█  ▀▄▀  █  █▄█  █▀█  ░█░  █  █▄█  █░▀█ --
-- ============================================== --
hl.bind(mainMod .. " + H",          hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + L",          hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "r-1" }))

-- Relative move to workspace
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ workspace = "r+1" }))

-- Direct access [1–10]
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end


-- ======================= --
-- █▄ ▄█  █▀▀  █▀▄  █  ▄▀█ --
-- █░▀░█  ██▄  █▄▀  █  █▀█ --
-- ======================= --
-- Volume / brightness
local mediaKeys = {
	{ "XF86AudioRaiseVolume",  "wpctl set-volume -l 1.25 @DEFAULT_AUDIO_SINK@ 5%+" },
	{ "XF86AudioLowerVolume",  "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-" },
	{ "XF86AudioMute",         "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" },
	{ "XF86AudioMicMute",      "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" },
	{ "XF86MonBrightnessUp",   "brightnessctl s 10%+" },
	{ "XF86MonBrightnessDown", "brightnessctl s 10%-" },
}
for _, k in ipairs(mediaKeys) do
	hl.bind(k[1], hl.dsp.exec_cmd(k[2]), { locked = true, repeating = true })
end

-- Media playback (playerctl)
local playbackKeys = {
	{ "XF86AudioNext",  "playerctl next" },
	{ "XF86AudioPause", "playerctl play-pause" },
	{ "XF86AudioPlay",  "playerctl play-pause" },
	{ "XF86AudioPrev",  "playerctl previous" },
}
for _, k in ipairs(playbackKeys) do
	hl.bind(k[1], hl.dsp.exec_cmd(k[2]), { locked = true })
end


-- ====================================================== --
-- █▀▀  █▀▀  █▀▄  █▀▀  █▀▀  █▄░█  █▀▀  █░█  █▀█  ▀█▀  █▀▀ --
-- ▄▄█  █▄▄  █▀▄  ██▄  ██▄  █░▀█  ▄▄█  █▀█  █▄█  ░█░  ▄▄█ --
-- ====================================================== --
hl.bind("PRINT",                   hl.dsp.exec_cmd([[grim - | tee ~/media/screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy]]))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | tee ~/media/screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy]]))
