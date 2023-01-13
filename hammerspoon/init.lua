hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true
spoon.SpoonInstall:andUse("ReloadConfiguration")
spoon.SpoonInstall:andUse("Cherry")

spoon.ReloadConfiguration:start()

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

local caffeine = hs.menubar.new()
local function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("NORMAL")
    end
end

local function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

