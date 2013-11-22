obstacleManager = Core.class(Sprite)

--[[
function obstacleManager:init(x, y)
	self.body = world:createBody{type = b2.DYNAMIC_BODY, position = {x = x-10, y = y-20}}
	self.body.type = "obstacles"
	self.body.name = "gem"

	local shape = b2.PolygonShape.new()
	--self.shape = b2.PolygonShape.new()
	shape:setAsBox(10, 11)
	--self.shape:setAsBox(10, 11)
	self.body:createFixture{shape = shape, density = 1, restitution = 0.1, friction = 0.3}

	self.sprite = Bitmap.new(Texture.new("res/salmon.png"))
	self.sprite:setAnchorPoint(0.4, 0.3)
	self.sprite:setPosition(x,y)
	self:addChild(self.sprite)
	self.body.object=self.sprite
	self.sprite.body=self.body
	obstacles[self.body] = self.sprite
	--obstacleManager:applyForce()
	--self.applyForce()
	self.body:setLinearVelocity(0, 30)

	stage:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end
]]--

local sp = { "res/salmon.png", "res/gem.png", "res/snowball.png", "res/ice.png", "res/fall.png"}

function obstacleManager:createStaticObstacle(x,y,gambar)
	local obstacle = {}
	obstacle.body = world:createBody{type = b2.DYNAMIC_BODY, position = {x = x-10, y = y-20}}
	
	obstacle.body.gambar = gambar
	obstacle.body.type = "obstacles"
	obstacle.body.name = "gem"

	local shape = b2.PolygonShape.new()
	if (gambar==3) then
		shape:setAsBox(35, 45)
	elseif (gambar==4 or gambar==5) then
		shape:setAsBox(150, 50)
	else
		shape:setAsBox(10,11)
	end
	obstacle.body:createFixture{shape = shape, density = 1, restitution = 0.1, friction = 0.3}
	
	obstacle.sprite = Bitmap.new(Texture.new(sp[gambar]))
	obstacle.sprite:setAnchorPoint(0.4, 0.3)
	obstacle.sprite:setPosition(x,y)
	stage:addChild(obstacle.sprite)
	obstacle.body.object=obstacle.sprite
	obstacle.body:setLinearVelocity(0, 30)
	obstacle.body.obstacle = obstacle
	obstacle.body.active=true
	obstacle.name = name
	obstacle.onEnterFrame=function ()
		if (obstacle.body.active) then
			obstacle.sprite:setPosition(obstacle.body:getPosition())
			obstacle.sprite:setRotation(obstacle.body:getAngle() * 180 / math.pi)
		else
			stage:removeEventListener(Event.ENTER_FRAME, obstacle.onEnterFrame)
		end		 
	end
	stage:addEventListener(Event.ENTER_FRAME, obstacle.onEnterFrame)
	return obstacle
end

function obstacleManager:setWorld(worldDef)
	world = worldDef
end


