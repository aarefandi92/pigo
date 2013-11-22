local pigo = pigo.new()
local acceloHandler = acceloHandler.new()
local collisionHandler = collisionHandler.new()

local object = {}
local obstacles = {}
local body 
local player
local screenHeight 
local screenWidth
local world
local sprite

local function init()
	screenHeight = application:getLogicalHeight()
	screenWidth = application:getLogicalWidth()

	--set gravity
	world = b2.World.new(0, 0)
	setWorld(world)
	
	pigo:createPigo()

	local debugDraw = b2.DebugDraw.new()
	world:setDebugDraw(debugDraw)
	--stage:addChild(debugDraw)
end

function onEnterFrame()
	if(math.random(1, 50)<3) then
		obstacleManager:createStaticObstacle(math.random(80, 260), 11, math.random(1,2))
	end
	if(math.random(1, 1000)<3) then
		obstacleManager:createStaticObstacle(140, 11, 3)
	end
	if(math.random(1, 200)<2) then
		obstacleManager:createStaticObstacle(140, 11, math.random(4,5))
	end
end

function setWorld()
	pigo:setWorld(world)
	acceloHandler:setWorld(world)
	collisionHandler:setWorld(world)
	obstacleManager:setWorld(world)
end

init()
--acceloHandler:setObject(object)
--collisionHandler:setObject(object)
--acceloHandler:setObstacles(obstacleManager:getObstacles())
collisionHandler:setCollisionListener()
stage:addChild(acceloHandler)
stage:addEventListener(Event.ENTER_FRAME, onEnterFrame)