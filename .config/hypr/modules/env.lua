-- █▀▀ █▄░█ █░█
-- ██▄ █░▀█ ▀▄▀


-- Theme settings
hl.env("XCURSOR_SIZE",   "24")
hl.env("XCURSOR_THEME",  "colloid")
hl.env("GTK_THEME",      "Adwaita:dark")
hl.env("GTK_USE_PORTAL", "1")

-- Session / XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE",    "wayland")

-- Toolkit backends
hl.env("GDK_BACKEND",                  "wayland,x11")
hl.env("QT_QPA_PLATFORM",              "wayland")
hl.env("SDL_VIDEODRIVER",              "wayland")
hl.env("OZONE_PLATFORM",               "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
