-- sun.lua
-- Handles sun logic

local sun = {x = 400, y = 120, radius = 40}

function sun.update(player)
    sun.x = 400 - (player.x * 0.2)
end

function sun.draw()
    love.graphics.setColor(1, 1, 0.2)
    love.graphics.circle("fill", sun.x, sun.y, sun.radius)
end

return sun
