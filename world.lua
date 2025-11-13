

-- world.lua
-- Handles different worlds/ages

local world = {}

world.currentAge = 1
world.ages = {
    {name = "Barndom", color = {0.5, 0.8, 1}},
    {name = "Tonår", color = {0.8, 0.5, 1}},
    {name = "Vuxen", color = {1, 0.8, 0.5}},
    {name = "Ålderdom", color = {0.7, 0.7, 0.7}}
}

function world.load()
    -- Can load graphics and levels here later
end

function world.update(dt)
    -- Switch world/age with up/down arrow
    if love.keyboard.isDown("up") then
        world.currentAge = math.min(world.currentAge + 1, #world.ages)
    elseif love.keyboard.isDown("down") then
        world.currentAge = math.max(world.currentAge - 1, 1)
    end
end

function world.draw()
    local age = world.ages[world.currentAge]
    love.graphics.clear(age.color)
    love.graphics.setColor(0,0,0)
    love.graphics.print("World: " .. age.name, 10, 10)
end

return world
