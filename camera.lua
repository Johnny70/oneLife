-- camera.lua
-- Handles camera logic

local camera = {x = 0, y = 0}

function camera.update(player)
    camera.x = player.x - 400
end

function camera.get()
    return camera.x, camera.y
end

return camera
