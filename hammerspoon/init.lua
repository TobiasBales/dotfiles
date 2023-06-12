hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true
spoon.SpoonInstall:andUse("ReloadConfiguration")
-- spoon.SpoonInstall:andUse("Cherry")

spoon.ReloadConfiguration:start()

local wm = require('window-management')
local caffeine = require('caffeine')

local hyper = { "cmd", "alt", "ctrl", "shift" }
local half_hyper = { "alt", "ctrl", "shift" }

local applicationHotkeys = {
  b = 'Google Chrome',
  t = 'kitty',
  s = 'Slack',
  g = 'Logseq',
  c = 'Visual Studio Code',
  m = 'Google Meet',
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
  hs.hotkey.bind(half_hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end


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
