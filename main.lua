

-- main.lua
-- Entry point for the OneLife game

local player = require "player"
local world = require "world"

local camera = require "camera"
local sun = require "sun"

function love.load()
    love.window.setFullscreen(true)
    world.load()
    player.load()
end

function love.update(dt)
    player.update(dt, {})
    world.update(dt)
    camera.update(player)
    sun.update(player)
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
    local camX, camY = camera.get()
    love.graphics.push()
    love.graphics.translate(-camX, -camY)
    world.draw()
    sun.draw()
    -- Draw ground
    love.graphics.setColor(0.2, 0.7, 0.2)
    love.graphics.rectangle("fill", camX, 300, 5000, 300)
    player.draw()
    love.graphics.pop()
    -- Draw world text always at top left of screen
    love.graphics.setColor(0,0,0)
    love.graphics.print("World: OneLife", 10, 10)
end
