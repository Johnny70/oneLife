-- player.lua
-- Handles main character logic

-- Player module
local player = {}

player.x = 100
player.feetY = 450 -- feet position (middle of ground)
player.width = 32
player.height = 48
player.vx = 0
player.vy = 0
player.speed = 200
player.jumpForce = -400
player.onGround = false
player.ducking = false

local gravity = 900

function player.load()
    -- Can load graphics here later
end

function player.update(dt, platforms)
    -- Horizontal movement (WASD)
    if love.keyboard.isDown("a") then
        player.vx = -player.speed
    elseif love.keyboard.isDown("d") then
        player.vx = player.speed
    else
        player.vx = 0
    end

    -- Ducking (S)
    local normalHeight = 48
    local duckHeight = 24
    if player.lastDuckState == nil then player.lastDuckState = false end
    local isDuck = love.keyboard.isDown("s")
    if isDuck ~= player.lastDuckState then
        if isDuck then
            player.height = duckHeight
        else
            player.height = normalHeight
        end
    end
    player.ducking = isDuck
    player.lastDuckState = isDuck

    -- Jump (Space)
    if love.keyboard.isDown("space") and player.onGround then
        player.vy = player.jumpForce
        player.onGround = false
    end

    -- Physics
    player.vy = player.vy + gravity * dt
    player.x = player.x + player.vx * dt
    if player.x < 100 then player.x = 100 end
    player.feetY = player.feetY + player.vy * dt

    -- Ground collision
    if player.feetY > 450 then
        player.feetY = 450
        player.vy = 0
        player.onGround = true
    else
        player.onGround = false
    end
end

function player.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", player.x, player.feetY - player.height, player.width, player.height)
end

return player
