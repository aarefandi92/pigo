obstacleManager = Core.class(Sprite)

local obstacles = {}
local world = b2.World.new(0, 0)
local posSalmonX
local posSalmonY
local ikanSalmon = {}

function obstacleManager:init()
	local body = world:createBody{type = b2.DYNAMIC_BODY, position = {x = 100, y = 150}}
	
	body.name = "obstacle"

	local shape = b2.PolygonShape.new()
	shape:setAsBox(40, 40)
	body:createFixture{shape = shape, density = 1, restitution = 0.1, friction = 0.3}

	local sprite = Bitmap.new(Texture.new("res/salmon.png"))
	sprite:setAnchorPoint(0.5, 0.5)
	sprite:setPosition(100,150)
	stage:addChild(sprite)
	
	obstacles[body] = sprite
end

function obstacleManager:createStaticObstacle(x,y)
	local body = world:createBody{type = b2.DYNAMIC_BODY, position = {x = x, y = y}}
	
	body.name = "obstacle"

	local shape = b2.PolygonShape.new()
	shape:setAsBox(40, 40)
	body:createFixture{shape = shape, density = 1, restitution = 0.1, friction = 0.3}

	local sprite = Bitmap.new(Texture.new("res/salmon.png"))
	sprite:setAnchorPoint(0.5, 0.5)
	sprite:setPosition(x,y)
	stage:addChild(sprite)
	
	obstacles[body] = sprite
end

function obstacleManager:setWorld(worldDef)
	world = worldDef
end

function obstacleManager:getObstacles()
	return obstacles
end