collisionHandler=Core.class(Sprite)

local objectToMove = {}
local world

-- deskripsi
local fx
local xPosition

local initVeloX
local initVeloY
local salmon = 0
local gem = 0
local jumlahSalmon = HUDSalmon.new(salmon)
local jumlahGem = HUDGem.new(gem)

function collisionHandler:init()
	screenHeight = application:getLogicalHeight()
	screenWidth = application:getLogicalWidth()
	initVeloX = 0
	initVeloY = 0
	stage:addChild(jumlahSalmon)
	stage:addChild(jumlahGem)
end

function collisionHandler:setObject(object)
	objectToMove = object
end

function collisionHandler:setWorld(worldRef)
	world = worldRef
end

-- untuk collision
local function onBeginContact(e)
	--getting contact bodies
    local fixtureA = e.fixtureA
    local fixtureB = e.fixtureB
    local bodyA = fixtureA:getBody()
    local bodyB = fixtureB:getBody()
	--creating timer to delay removing bodies
    --1 milisecond
	if(bodyA.name=="pigo") then
		if(bodyB.gambar==1 or bodyB.gambar==2) then
			bodyB.active=false
			Timer.delayedCall(1, function()
					world:destroyBody(bodyB)
					stage:removeChild(bodyB.obstacle.sprite)
					if (bodyB.gambar == 1) then
					salmon = salmon+1
					jumlahSalmon:setText(salmon)
					else 
					gem = gem+1
					jumlahGem:setText(gem)
					end
			end)
		else 
			bodyA.active=false
			Timer.delayedCall(1, function()
				world:destroyBody(bodyA)
				stage:removeChild(bodyA.character.sprite)
			end)
		end
	end
end

function collisionHandler:setCollisionListener()
	-- register 4 physics events with the world object
	world:addEventListener(Event.BEGIN_CONTACT, onBeginContact)
	--end collision
end