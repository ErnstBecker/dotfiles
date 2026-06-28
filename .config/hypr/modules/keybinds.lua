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

-- Window resize (Vim-style)
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -100, y =    0, relative = true }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x =  100, y =    0, relative = true }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x =    0, y = -100, relative = true }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x =    0, y =  100, relative = true }))
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Focus movement (Vim-style)
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ direction = "right" }))


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
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),    { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"),                         { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),                         { locked = true, repeating = true })

-- Media playback (playerctl)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


-- ====================================================== --
-- █▀▀  █▀▀  █▀▄  █▀▀  █▀▀  █▄░█  █▀▀  █░█  █▀█  ▀█▀  █▀▀ --
-- ▄▄█  █▄▄  █▀▄  ██▄  ██▄  █░▀█  ▄▄█  █▀█  █▄█  ░█░  ▄▄█ --
-- ====================================================== --
hl.bind("PRINT",                   hl.dsp.exec_cmd([[grim - | tee ~/media/screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy]]))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | tee ~/media/screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy]]))
