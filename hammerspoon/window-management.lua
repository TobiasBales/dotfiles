
local m = {}

local HORIZONTAL_GRID = 3
local HORIZONTAL_CELL = 1
local VERTICAL_GRID = 2
local VERTICAL_CELL = 1

hs.grid.setGrid(HORIZONTAL_GRID .. 'x' .. VERTICAL_GRID)
hs.grid.setMargins({5, 5})
hs.window.animationDuration = 0

local screenPositions       = {}
screenPositions.leftTwoThirds  = {
  x = 0, y = 0,
  w = HORIZONTAL_CELL * 2, h = VERTICAL_GRID
}
screenPositions.leftThird  = {
  x = 0, y = 0,
  w = HORIZONTAL_CELL, h = VERTICAL_GRID
}
screenPositions.middleThird = {
  x = HORIZONTAL_CELL, y = 0,
  w = HORIZONTAL_CELL, h = VERTICAL_GRID
}
screenPositions.rightThird  = {
  x = HORIZONTAL_CELL * 2, y = 0,
  w = HORIZONTAL_CELL, h = VERTICAL_GRID
}
screenPositions.rightTwoThirds  = {
  x = HORIZONTAL_CELL, y = 0,
  w = HORIZONTAL_CELL * 2, h = VERTICAL_GRID
}
screenPositions.topLeft     = {
  x = 0, y = 0,
  w = HORIZONTAL_CELL, h = VERTICAL_CELL
}
screenPositions.topMiddle   = {
  x = HORIZONTAL_CELL, y = 0,
  w = HORIZONTAL_CELL, h = VERTICAL_CELL,
}
screenPositions.topRight    = {
  x = HORIZONTAL_CELL * 2, y = 0,
  w = HORIZONTAL_CELL, h = VERTICAL_CELL
}
screenPositions.bottomLeft  = {
  x = 0, y = VERTICAL_CELL,
  w = HORIZONTAL_CELL, h = VERTICAL_CELL
}
screenPositions.bottomMiddle = {
  x = HORIZONTAL_CELL, y = VERTICAL_CELL,
  w = HORIZONTAL_CELL, h = VERTICAL_CELL
}
screenPositions.bottomRight = {
  x = HORIZONTAL_CELL * 2, y = VERTICAL_CELL,
  w = HORIZONTAL_CELL, h = VERTICAL_CELL
}
m.screenPositions = screenPositions


-- This function will move either the specified or the focuesd
-- window to the requested screen position
function m.moveWindowToPosition(cell, window)
  if window == nil then
    window = hs.window.focusedWindow()
  end
  if window then
    local screen = window:screen()
    hs.grid.set(window, cell, screen)
  end
end

-- This function will move either the specified or the focused
-- window to the center of the sreen and let it fill up the
-- entire screen.
function m.windowMaximize(factor, window)
   if window == nil then
      window = hs.window.focusedWindow()
   end
   if window then
      window:maximize()
   end
end

return m
