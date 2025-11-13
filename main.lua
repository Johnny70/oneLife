
local player = require "player"
local world = require "world"

function love.load()
    love.window.setFullscreen(true)
    world.load()
    player.load()
end

function love.update(dt)
    player.update(dt)
    world.update(dt)
end

function love.draw()
    world.draw()
    player.draw()
end
-- main.lua
-- Entry point for the OneLife game

local player = require "player"
local world = require "world"

-- Basic platforms for level design
local platforms = {
    {x = 50, y = 350, width = 200, height = 20},
    {x = 300, y = 250, width = 150, height = 20},
    {x = 500, y = 180, width = 120, height = 20}
}

function love.load()
    world.load()
    player.load()
end

function love.update(dt)
    player.update(dt, platforms)
    world.update(dt)
end

function love.keypressed(key)
    -- Quit game with ESC
    if key == "escape" then
        love.event.quit()
    end
    -- Toggle fullscreen with F11
    if key == "f11" then
        local isFullscreen = love.window.getFullscreen()
        love.window.setFullscreen(not isFullscreen)
    end
end

function love.draw()
    world.draw()
    -- Draw platforms
    love.graphics.setColor(0.3, 0.3, 0.3)
    for _, plat in ipairs(platforms) do
        love.graphics.rectangle("fill", plat.x, plat.y, plat.width, plat.height)
    end
    player.draw()
end
