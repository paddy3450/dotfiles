------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "alacritty"
local fileManager = "nemo"
local menu = "wofi"
local browser = "firefox"
local musicplayer = "supersonic-desktop"
local gaps_in_var = 5
local gaps_out_var = 10
local gaps_on = "hyprctl keyword general:gaps_in $gaps_in_var; hyprctl keyword general:gaps_out $gaps_out_var"
local gaps_off = " hyprctl keyword general:gaps_in 0; hyprctl keyword general:gaps_out 0"
local orange = "rgba(FF7F50FF)"
local darkorange = "rgba(D2691EFF)"
local lightgray = "rgba(FFF8DCFF)"
local darkgray = "rgba(353535FF)"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & hyprpaper")
	hl.exec_cmd("hyprpm reload -n")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = gaps_in_var,
		gaps_out = gaps_out_var,

		border_size = 2,

		col = {
			active_border = { colors = { darkorange, darkorange }, angle = 45 },
			inactive_border = darkgray,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "master",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},
})

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		force_split = 2,
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
		new_on_top = true,
		new_status = "slave",
		mfact = 0.55,
		-- }
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true,
		on_focus_under_fullscreen = 1,
		background_color = lightgray,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
-- function M.split_monitor_workspaces()
-- 	if hl.plugin.split_monitor_workspaces ~= nil then
-- 		hl.config({
-- 			plugin = {
-- 				split_monitor_workspaces = {
-- 					count = 10,
-- 					keep_focused = 0,
-- 					enable_notifications = 0,
-- 					enable_persistent_workspaces = 1,
-- 				},
-- 			},
-- 		})
-- 	end
-- end
-- cursor {
--     no_warps = true
-- }

-- plugin {
--     split-monitor-workspaces {
--         count = 10
--         keep_focused = 0
--         enable_notifications = 0
--         enable_persistent_workspaces = 1
--     }
-- }
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + X", hl.dsp.window.close())
closeWindowBind:set_enabled(true)
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(musicplayer))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("power_wofi"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("reaper"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("gimp"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("gtk"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("obs"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("manager"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("home"))
hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd("togglekeyd"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("neca"))

-- Move focus with mainMod + HJKL keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- general window/workspace commands
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))
-- hl.bind(mainMod .. " + SPACE", hl.dsp.window.bringactivetotop())
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + TAB", hl.dsp.window.alter_zorder({ mode = "top" }))
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ next = "w-1" }))
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.alter_zorder({ mode = "top" }))
hl.bind(mainMod .. " + N", hl.dsp.focus({ monitor = "m + 1" }))
hl.bind(mainMod .. " + P", hl.dsp.focus({ monitor = "m - 1" }))
-- replace this with lua at some point
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("hypr_layout_toggle"))

--screenshot
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. "+ SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ###################
-- ### KEYBINDINGS ###
-- ###################
--
-- $mainMod = SUPER
--
-- bind = $mainMod, X, killactive,
-- bind = $mainMod SHIFT, Q, exit,
-- bind = $mainMod, T, togglefloating,
-- bind = $mainMod, C, exec, $terminal
-- bind = $mainMod, D, exec, $menu
-- bind = $mainMod, F, exec, $fileManager
-- bind = $mainMod, B, exec, $browser
-- bind = $mainMod SHIFT, M, exec, $musicplayer
-- bind = $mainMod SHIFT, X, exec, power_wofi
-- bind = $mainMod SHIFT, S, exec, steam
-- bind = $mainMod SHIFT, R, exec, reaper
-- bind = $mainMod SHIFT, G, exec, gimp
-- bind = $mainMod SHIFT, T, exec, transmission-gtk
-- bind = $mainMod SHIFT, O, exec, obs
-- bind = $mainMod SHIFT, D, exec, discord
-- bind = $mainMod SHIFT, V, exec, virt-manager
-- bind = $mainMod SHIFT, W, exec, weather-home
-- bind = $mainMod SHIFT, z, exec, togglekeyd
-- bind = $mainMod SHIFT, E, exec, neca
--
-- # Move focus with mainMod + hjkl keys
-- bind = $mainMod, H, movefocus, l
-- bind = $mainMod, L, movefocus, r
-- bind = $mainMod, K, movefocus, u
-- bind = $mainMod, J, movefocus, d
-- bind = $mainMod, H, bringactivetotop
-- bind = $mainMod, L, bringactivetotop
-- bind = $mainMod, K, bringactivetotop
-- bind = $mainMod, J, bringactivetotop
--
-- # Switch workspaces with mainMod + [0-9]
-- bind = $mainMod, 1, split-workspace, 1
-- bind = $mainMod, 2, split-workspace, 2
-- bind = $mainMod, 3, split-workspace, 3
-- bind = $mainMod, 4, split-workspace, 4
-- bind = $mainMod, 5, split-workspace, 5
-- bind = $mainMod, 6, split-workspace, 6
-- bind = $mainMod, 7, split-workspace, 7
-- bind = $mainMod, 8, split-workspace, 8
-- bind = $mainMod, 9, split-workspace, 9
-- bind = $mainMod, 0, split-workspace, 10
--
-- # Move active window to a workspace with mainMod + SHIFT + [0-9]
-- bind = $mainMod SHIFT, 1, split-movetoworkspacesilent, 1
-- bind = $mainMod SHIFT, 2, split-movetoworkspacesilent, 2
-- bind = $mainMod SHIFT, 3, split-movetoworkspacesilent, 3
-- bind = $mainMod SHIFT, 4, split-movetoworkspacesilent, 4
-- bind = $mainMod SHIFT, 5, split-movetoworkspacesilent, 5
-- bind = $mainMod SHIFT, 6, split-movetoworkspacesilent, 6
-- bind = $mainMod SHIFT, 7, split-movetoworkspacesilent, 7
-- bind = $mainMod SHIFT, 8, split-movetoworkspacesilent, 8
-- bind = $mainMod SHIFT, 9, split-movetoworkspacesilent, 9
-- bind = $mainMod SHIFT, 0, split-movetoworkspacesilent, 10
--
-- #general window/workspace commands
-- bind = $mainMod, M, fullscreen
-- bind = $mainMod, space, bringactivetotop
-- bind = ALT ,TAB, cyclenext
-- bind = ALT ,TAB, bringactivetotop
-- bind = ALT SHIFT,TAB, cyclenext, prev
-- bind = ALT SHIFT,TAB, bringactivetotop
-- bind = $mainMod, N, focusmonitor, +1
-- bind = $mainMod, P, focusmonitor, -1
-- bind = $mainMod, Y, exec, hypr_layout_toggle
--
-- # Screenshot a window
-- bind = $mainMod, PRINT, exec, hyprshot -m window
-- # Screenshot a monitor
-- bind = , PRINT, exec, hyprshot -m output
-- # Screenshot a region
-- bind = $shiftMod, PRINT, exec, hyprshot -m region
--
-- #split-monitor-workspaces commands
-- bind = $mainMod, ESCAPE, workspace, previous
-- bind = $mainMod, TAB, split-cycleworkspaces, next
-- bind = $mainMod SHIFT, TAB, split-cycleworkspaces, prev
-- bind = $mainMod SHIFT, N, split-changemonitorsilent, next
-- bind = $mainMod SHIFT, P, split-changemonitorsilent, prev
--
-- #master layout commands
-- bind = $mainMod, RETURN, layoutmsg, swapwithmaster master
-- bind = $mainMod, I, layoutmsg, addmaster
-- bind = $mainMod, O, layoutmsg, removemaster
-- bind = $mainMod SHIFT, J, layoutmsg, swapnext
-- bind = $mainMod SHIFT, K, layoutmsg, swapprev
-- bind = $mainMod SHIFT, H, layoutmsg, mfact -0.02
-- bind = $mainMod SHIFT, L, layoutmsg, mfact +0.02
-- bind = $mainMod, R, layoutmsg, orientationnext
-- bind = $mainMod SHIFT, R, layoutmsg, orientationprev
--
-- #dwindle layout commands
-- bind = $mainMod, RETURN, layoutmsg, movetoroot
-- bind = $mainMod SHIFT, J, layoutmsg, preselect d
-- bind = $mainMod SHIFT, K, layoutmsg, preselect u
-- bind = $mainMod SHIFT, H, layoutmsg, preselect l
-- bind = $mainMod SHIFT, L, layoutmsg, preselect r
-- bind = $mainMod, R, layoutmsg, swapsplit
--
-- #gaps on and off
-- bind = $mainMod, U, exec, $gaps_on
-- bind = $mainMod SHIFT, U, exec, $gaps_off
--
-- # Move/resize windows with mainMod + LMB/RMB and dragging
-- bindm = $mainMod, mouse:272, movewindow
-- bindm = $mainMod, mouse:273, resizewindow
--
-- # Laptop multimedia keys for volume and LCD brightness
-- bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
-- bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
-- bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
-- bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
-- bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
-- bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-
--
-- # Requires playerctl
-- bindl = , XF86AudioNext, exec, playerctl next
-- bindl = , XF86AudioPause, exec, playerctl play-pause
-- bindl = , XF86AudioPlay, exec, playerctl play-pause
-- bindl = , XF86AudioPrev, exec, playerctl previous

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
-- ##############################
-- ### WINDOWS AND WORKSPACES ###
-- ##############################
--
-- # Ignore maximize requests from apps. You'll probably like this.
-- # windowrule = suppressevent maximize, class:.*
--
-- # Fix some dragging issues with XWayland
-- # windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
