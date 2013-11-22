local acceloHandler = acceloHandler.new()
local collisionHandler = collisionHandler.new()
local obstacleManager = obstacleManager.new()
local object = {}
local body 
local player
local screenHeight 
local screenWidth
local world

local compass = compass.new()


local function init()
	screenHeight = application:getLogicalHeight()
	screenWidth = application:getLogicalWidth()
	
	--set gravity
	world = b2.World.new(0, 0)
	setWorld(world)
	--obstacleManager:createStaticObstacle(140,200)
	--obstacleManager:createStaticObstacle(200,300)
	
	local sound = Sound.new("res/sounds/BoxCat_Games_-_08_-_CPU_Talk.mp3")
	local channel = sound:play(1, 1000)
	stage:addChild(compass)
end

local function createObject()

	local shape = b2.PolygonShape.new()
	shape:setAsBox(10, 10)
	local fixtureDef = {shape = shape, density = 2, restitution = 0.2}
	
	-- mendefinisikan pergerakan objek berdasar physics
	local bodyDef = {type = b2.DYNAMIC_BODY, position = {x = 160, y = 440}, isSensor = false}
	body = world:createBody(bodyDef)
	body.name = "character"
	body:createFixture(fixtureDef)

	--initial velocity
	initVeloX,initVeloY = 0

	-- membuat objek yang bergerak di layar
	player = Bitmap.new(Texture.new("res/pigo.png"))
	player:setAnchorPoint(0.5, 0.5)
	local objectWidth = player:getWidth()
	local objectHeight = player:getHeight()

	--stone:setPosition(x/2,z)
	stage:addChild(player)
	object[body] = player
	
end

function setWorld()
	acceloHandler:setWorld(world)
	collisionHandler:setWorld(world)
	obstacleManager:setWorld(world)
end

init()
createObject()
acceloHandler:setObject(object)
collisionHandler:setObject(object)
acceloHandler:setObstacles(obstacleManager:getObstacles())
collisionHandler:setCollisionListener()

stage:addChild(acceloHandler)