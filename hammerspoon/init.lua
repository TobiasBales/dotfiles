hs.loadSpoon("SpoonInstall")

local hyper = { "cmd", "alt", "ctrl", "shift" }
local half_hyper = { "alt", "ctrl", "shift" }

spoon.SpoonInstall.use_syncinstall = true
spoon.SpoonInstall:andUse("ReloadConfiguration")
spoon.SpoonInstall:andUse("Cherry")

spoon.SpoonInstall:andUse("ClipboardTool",
  {
    disable = false,
    deduplicate = false,
    config = {
      show_in_menubar = false,
    },
    hotkeys = {
      toggle_clipboard = { { "cmd", "shift" }, "v" } },
    start = true,
  }
)

spoon.SpoonInstall:andUse("KSheet",
  {
    hotkeys = {
      toggle = { half_hyper, "n" }
    }
  })

spoon.SpoonInstall:andUse("AppLauncher", {
  modifiers = hyper,
  hotkeys = {
    b = 'Google Chrome',
    t = 'Kitty',
    s = 'Slack',
    g = 'Logseq',
    c = 'Visual Studio Code',
    m = 'Google Meet',
  }
})

spoon.SpoonInstall:andUse("Seal",
  {
    hotkeys = { show = { { "cmd" }, "space" } },
    fn = function(s)
      s:loadPlugins({ "apps", "calc",
        "screencapture", "useractions" })
      s.plugins.useractions.actions =
      {
        --        <<useraction-definitions>>
      }
      s:refreshAllCommands()
    end,
    start = true,
  }
)

spoon.ReloadConfiguration:start()

require("camera-notifications")
local wm = require('window-management')
require('caffeine')


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

spoon.SpoonInstall:andUse("FadeLogo",
  {
    config = {
      default_run = 1.0,
    },
    start = true
  }
)
