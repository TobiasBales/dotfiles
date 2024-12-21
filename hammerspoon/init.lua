hs.loadSpoon("SpoonInstall")

local hyper = { "cmd", "alt", "ctrl", "shift" }
local half_hyper = { "alt", "ctrl", "shift" }

spoon.SpoonInstall.use_syncinstall = true
spoon.SpoonInstall:andUse("ReloadConfiguration")
-- spoon.SpoonInstall:andUse("Cherry")

spoon.SpoonInstall:andUse("ClipboardTool", {
	disable = false,
	deduplicate = false,
	config = {
		show_in_menubar = false,
	},
	hotkeys = {
		toggle_clipboard = { { "cmd", "shift" }, "v" },
	},
	start = true,
	paste_on_select = true,
})
-- somehow setting this in the config above does not work, everything else does
local clipboard_tool = hs.loadSpoon("ClipboardTool")
clipboard_tool.show_copied_alert = false

spoon.SpoonInstall:andUse("KSheet", {
	hotkeys = {
		toggle = { half_hyper, "n" },
	},
})

spoon.SpoonInstall:andUse("AppLauncher", {
	modifiers = hyper,
	hotkeys = {
		b = "Google Chrome",
		t = "Kitty",
		s = "Slack",
		g = "Obsidian",
		c = "Visual Studio Code",
		m = "Google Meet",
	},
})

spoon.SpoonInstall:andUse("Seal", {
	hotkeys = { show = { { "cmd" }, "space" } },
	fn = function(s)
		s:loadPlugins({ "apps", "calc", "screencapture", "useractions" })
		s.plugins.useractions.actions = {
			--        <<useraction-definitions>>
		}
		s:refreshAllCommands()
	end,
	start = true,
})
spoon.SpoonInstall:asyncUpdateAllRepos()

spoon.ReloadConfiguration:start()

require("camera-notifications")
local wm = require("window-management")
-- require('caffeine')
local util = require("util")

hs.hotkey.bind(half_hyper, "h", function()
	wm.moveWindowToPosition(wm.screenPositions.leftTwoThirds)
end)
hs.hotkey.bind(half_hyper, "j", function()
	wm.moveWindowToPosition(wm.screenPositions.leftThird)
end)
hs.hotkey.bind(half_hyper, "k", function()
	wm.moveWindowToPosition(wm.screenPositions.middleThird)
end)
hs.hotkey.bind(half_hyper, "l", function()
	wm.moveWindowToPosition(wm.screenPositions.rightThird)
end)
hs.hotkey.bind(half_hyper, ";", function()
	wm.moveWindowToPosition(wm.screenPositions.rightTwoThirds)
end)
hs.hotkey.bind(half_hyper, "u", function()
	wm.moveWindowToPosition(wm.screenPositions.topLeft)
end)
hs.hotkey.bind(half_hyper, "i", function()
	wm.moveWindowToPosition(wm.screenPositions.topMiddle)
end)
hs.hotkey.bind(half_hyper, "o", function()
	wm.moveWindowToPosition(wm.screenPositions.topRight)
end)
hs.hotkey.bind(half_hyper, "m", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomLeft)
end)
hs.hotkey.bind(half_hyper, ",", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomMiddle)
end)
hs.hotkey.bind(half_hyper, ".", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomRight)
end)
hs.hotkey.bind(half_hyper, "y", function()
	wm.windowMaximize(0)
end)
hs.hotkey.bind(half_hyper, "q", function()
	wm.moveWindowToPreviousScreen()
end)
hs.hotkey.bind(half_hyper, "e", function()
	wm.moveWindowToNextScreen()
end)
hs.hotkey.bind(half_hyper, "w", function()
	wm.moveWindowToFocusedScreen()
end)

hs.window.layout.applyLayout({
	{ { "kitty" }, "move 1 [0,0,100,100] 0,0" },
})

spoon.SpoonInstall:andUse("FadeLogo", {
	config = {
		default_run = 1.0,
	},
	start = true,
})
