
local player = {}

player.x = 100
player.y = 300
player.width = 32
player.height = 48
player.vx = 0
player.vy = 0
player.speed = 200
player.jumpForce = -400
player.onGround = false

gravity = 900

-- player.lua
-- Handles main character logic

local player = {}

player.x = 100
player.y = 300
player.width = 32
player.height = 48
player.vx = 0
player.vy = 0
player.speed = 200
player.jumpForce = -400
player.onGround = false



function player.load()
    -- Can load graphics here later
end

function player.update(dt, platforms)
    -- Horizontal movement
    if love.keyboard.isDown("left") then
        player.vx = -player.speed
    elseif love.keyboard.isDown("right") then
        player.vx = player.speed
    else
        player.vx = 0
    end

    -- Jump
    if love.keyboard.isDown("space") and player.onGround then
        player.vy = player.jumpForce
        player.onGround = false
    end

    -- Physics
    player.vy = player.vy + gravity * dt
    player.x = player.x + player.vx * dt
    player.y = player.y + player.vy * dt

    -- Check collision with a platform
    local function checkPlatformCollision(px, py, pw, ph, plat)
        return px < plat.x + plat.width and
               px + pw > plat.x and
               py < plat.y + plat.height and
               py + ph > plat.y
    end

    -- Simple ground check
    if player.y > 300 then
        player.y = 300
        player.vy = 0
        player.onGround = true
    end

    -- Platform collision
    player.onGround = false
    for _, plat in ipairs(platforms or {}) do
        if checkPlatformCollision(player.x, player.y, player.width, player.height, plat) then
            if player.vy > 0 and player.y + player.height - player.vy * dt <= plat.y then
                player.y = plat.y - player.height
                player.vy = 0
                player.onGround = true
            end
        end
    end
end

function player.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

return player
