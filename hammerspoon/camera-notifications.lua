local work = require('work')
if not work then
    return
end

local util = require("util")

local function mainCamera()
    for _, camera in pairs(hs.camera.allCameras()) do
        if camera:name() == "Logitech BRIO" then
            return camera
        end
        print(camera)
    end
end

local camera = mainCamera()
if not camera then
    hs.notify.show("Main camera missing", "Could not find Logitech BRIO", "")
    return
end
print(camera)


-- function camerasChanged(args)
--     print("cameras changed")
--     print(util.dump(args))
-- end
-- hs.camera.setWatcherCallback(camerasChanged)

