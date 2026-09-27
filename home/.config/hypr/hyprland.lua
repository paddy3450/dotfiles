---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
require("monitors")
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
local menu = "wofi -S run"
local browser = "firefox"
local musicplayer = "supersonic-desktop"
local display_config = "nwg-displays"
local gaps_in_var = 5
local gaps_out_var = 10
local gaps_on = "hyprctl keyword general:gaps_in $gaps_in_var; hyprctl keyword general:gaps_out $gaps_out_var"
local gaps_off = " hyprctl keyword general:gaps_in 0; hyprctl keyword general:gaps_out 0"
-- local orange = "rgba(FF7F50FF)"
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
	-- hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("dunst")
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
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(display_config))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(musicplayer))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("power_wofi"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("transmission-gtk"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("reaper"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("gimp"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("obs"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("virtmanager"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("weather-home"))
hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd("togglekeyd"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("neca"))

-- Move focus with mainMod + HJKL keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

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
hl.bind(mainMod .. " + N", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mainMod .. " + P", hl.dsp.focus({ monitor = "-1" }))

-- hl.bind(mainMod .. " + Y", function()
-- 	-- local layouts = { "scrolling", "dwindle", "master", "monocle" }
-- 	local layouts = { "dwindle", "master" }
-- 	local workspace = hl.get_active_workspace()
-- 	if hl.get_active_special_workspace() then
-- 		workspace = hl.get_active_special_workspace()
-- 	end
--
-- 	local next_layout = "dwindle"
--
-- 	if not workspace then
-- 		return
-- 	end
--
-- 	for i = 1, #layouts do
-- 		if layouts[i] == workspace.tiled_layout then
-- 			local next_layout_idx = (i % #layouts) + 1
-- 			next_layout = layouts[next_layout_idx]
-- 			break
-- 		end
-- 	end
--
-- 	if workspace.special then
-- 		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
-- 	else
-- 		hl.workspace_rule({ workspace = "name:" .. tostring(workspace.name), layout = next_layout })
-- 	end
-- end)

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

-- LICENSE: 0BSD
-- per monitor workspaces
local workspaces_per_monitor = 10
local wrap_around = true
local function create_workspaces(monitor)
	for i = 1, workspaces_per_monitor do
		hl.workspace_rule({
			workspace = tostring(monitor.id * workspaces_per_monitor + i),
			monitor = monitor.name,
			persistent = true,
			default = (i == 1),
		})
	end
end
for _, monitor in ipairs(hl.get_monitors()) do
	create_workspaces(monitor)
end
hl.on("monitor.added", create_workspaces)

local function get_active_monitor_id()
	local monitor = hl.get_active_monitor()
	return monitor and monitor.id or 0
end

local function get_relative_workspace_index(forwards)
	local current_workspace = hl.get_active_workspace()
	if not current_workspace then
		return nil
	end
	local index = current_workspace.id % workspaces_per_monitor
	if index == 0 then
		index = workspaces_per_monitor
	end
	-- yandere dev style /s
	if forwards then
		index = index + 1
		if index > workspaces_per_monitor then
			if wrap_around then
				index = 1
			else
				return nil
			end
		end
	else
		index = index - 1
		if index < 1 then
			if wrap_around then
				index = workspaces_per_monitor
			else
				return nil
			end
		end
	end
	return index
end

local function activate_workspace(number)
	return function()
		local monitor_id = get_active_monitor_id()
		hl.dispatch(hl.dsp.focus({ workspace = tostring(monitor_id * workspaces_per_monitor + number) }))
	end
end

local function move_to_workspace(number)
	return function()
		local monitor_id = get_active_monitor_id()
		hl.dispatch(
			hl.dsp.window.move({ workspace = tostring(monitor_id * workspaces_per_monitor + number), follow = true })
		)
	end
end

local function activate_workspace_relative(forwards)
	return function()
		local monitor_id = get_active_monitor_id()
		local index = get_relative_workspace_index(forwards)
		if not index then
			return
		end
		hl.dispatch(hl.dsp.focus({ workspace = tostring(monitor_id * workspaces_per_monitor + index) }))
	end
end

local function move_to_workspace_relative(forwards)
	return function()
		local monitor_id = get_active_monitor_id()
		local index = get_relative_workspace_index(forwards)
		if not index then
			return
		end
		hl.dispatch(
			hl.dsp.window.move({ workspace = tostring(monitor_id * workspaces_per_monitor + index), follow = true })
		)
	end
end

for i = 1, math.min(workspaces_per_monitor, 10) do
	local key = tostring(i % 10)
	hl.bind(mainMod .. " + " .. key, activate_workspace(i))
	hl.bind(mainMod .. " + SHIFT + " .. key, move_to_workspace(i))
end
hl.bind(mainMod .. " + mouse_up", activate_workspace_relative(true))
hl.bind(mainMod .. " + mouse_down", activate_workspace_relative(false))
hl.bind(mainMod .. " + TAB", activate_workspace_relative(true))
hl.bind(mainMod .. " + SHIFT + TAB", activate_workspace_relative(false))
hl.bind(mainMod .. " + CTRL + TAB", move_to_workspace_relative(true))
hl.bind(mainMod .. " + CTRL + SHIFT + TAB", move_to_workspace_relative(false))

hl.bind(mainMod .. " + ESCAPE", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.move({ monitor = "-1" }))

-- #master layout commands
hl.bind(mainMod .. " + RETURN", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + I", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + O", hl.dsp.layout("removemaster"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapnext noloop"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("swapprev noloop"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("mfact -0.02"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("mfact +0.02"))
hl.bind(mainMod .. " + R", hl.dsp.layout("orientationnext"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.layout("orientationprev"))

-- Toggle gaps_in between 0 and 3 (equivalent to  {3, 3, 3, 3} )
hl.bind(mainMod .. " + SHIFT + U", function()
	if hl.get_config("general.gaps_in").top == gaps_in_var then
		hl.config({ ["general.gaps_in"] = 0 })
		hl.config({ ["general.gaps_out"] = 0 })
	else
		hl.config({ ["general.gaps_in"] = gaps_in_var })
		hl.config({ ["general.gaps_out"] = gaps_out_var })
	end
end)
hl.bind(mainMod .. " + SHIFT + EQUAL", function()
	local new_gap = hl.get_config("general.gaps_in").top + 3
	hl.config({ ["general.gaps_in"] = new_gap })
	hl.config({ ["general.gaps_out"] = new_gap * 2 })
end)
hl.bind(mainMod .. " + SHIFT + MINUS", function()
	local new_gap = hl.get_config("general.gaps_in").top - 3
	hl.config({ ["general.gaps_in"] = new_gap })
	hl.config({ ["general.gaps_out"] = new_gap * 2 })
end)

-- ###################
-- ### KEYBINDINGS ###
-- ###################

-- #dwindle layout commands
-- hl.bind(mainMod .. " + RETURN", hl.dsp.layout("movetoroot"))
-- hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("preselect d"))
-- hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("preselect u"))
-- hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("preselect l"))
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("preselect r"))
-- hl.bind(mainMod .. " + R", hl.dsp.layout("swapsplit"))

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
