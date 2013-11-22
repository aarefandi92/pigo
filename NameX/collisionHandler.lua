collisionHandler=Core.class(Sprite)

local objectToMove = {}
local world

-- deskripsi
local fx
local xPosition

local initVeloX
local initVeloY

function collisionHandler:init()
	screenHeight = application:getLogicalHeight()
	screenWidth = application:getLogicalWidth()
	initVeloX = 0
	initVeloY = 0
end

function collisionHandler:setObject(object)
	objectToMove = object
end

function collisionHandler:setWorld(worldRef)
	world = worldRef
end

-- untuk collision
local function onBeginContact(event)
	-- you can get the fixtures and bodies in this contact like:
	local fixtureA = event.fixtureA
	local fixtureB = event.fixtureB
	local bodyA = fixtureA:getBody()
	local bodyB = fixtureB:getBody()
	
	print("begin contact: "..bodyA.name.."<->"..bodyB.name)
end

local function onEndContact(event)
	-- you can get the fixtures and bodies in this contact like:
	local fixtureA = event.fixtureA
	local fixtureB = event.fixtureB
	local bodyA = fixtureA:getBody()
	local bodyB = fixtureB:getBody()

	print("end contact: "..bodyA.name.."<->"..bodyB.name)
end

local function onPreSolve(event)
	-- you can get the fixtures and bodies in this contact like:
	local fixtureA = event.fixtureA
	local fixtureB = event.fixtureB
	local bodyA = fixtureA:getBody()
	local bodyB = fixtureB:getBody()
	
	--berhenti dan menyimpan nilai ketika collision
	for body,sprite in pairs(objectToMove) do
		if bodyA.name == "character" and bodyB.name == "obstacles" then
			initVeloX,initVeloY = body:getLinearVelocity()
			bodyA:setLinearVelocity(0,0)
			print("pre solve: "..bodyA.name.."<->"..bodyB.name)
		end
	end
	
end

local function onPostSolve(event)
	-- you can get the fixtures and bodies in this contact like:
	local fixtureA = event.fixtureA
	local fixtureB = event.fixtureB
	local bodyA = fixtureA:getBody()
	local bodyB = fixtureB:getBody()
	
	print(initVeloX.." "..initVeloY)
	if bodyA.name == "character" and bodyB.name == "obstacles" then
		--mengembalikan seperti semula
		bodyA:setLinearVelocity(initVeloX,initVeloY)
	end

	print("post solve: "..bodyA.name.."<->"..bodyB.name)
end


function collisionHandler:setCollisionListener()
	-- register 4 physics events with the world object
	world:addEventListener(Event.BEGIN_CONTACT, onBeginContact)
	world:addEventListener(Event.END_CONTACT, onEndContact)
	world:addEventListener(Event.PRE_SOLVE, onPreSolve)
	world:addEventListener(Event.POST_SOLVE, onPostSolve)
	--end collision
end
