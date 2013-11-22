pigo = Core.class(sprite)

local body
local sprite

function pigo:init()

end

function pigo:createPigo()
	local character = {}
	character.body = world:createBody{type = b2.STATIC_BODY, position = {x = 156, y = 428}}
	character.body.type = "character"
	character.body.name = "pigo"
	local shape = b2.PolygonShape.new()
	shape:setAsBox(20, 31)
	character.body:createFixture{shape = shape, density = 1, restitution = 0.1, friction = 0.3}
	character.sprite = Bitmap.new(Texture.new("res/pigo.png"))
	character.sprite:setAnchorPoint(0.5, 0.5)
	character.sprite:setPosition(160,430)
	stage:addChild(character.sprite)
	character.body.object = character.sprite
	character.body.character = character
	character.onEnterFrame=function ()
		if (character.body.active) then
			character.sprite:setPosition(character.body:getPosition())
			character.sprite:setRotation(character.body:getAngle() * 180 / math.pi)
		else
			stage:removeEventListener(Event.ENTER_FRAME, character.onEnterFrame)
		end		 
	end
	stage:addEventListener(Event.ENTER_FRAME, character.onEnterFrame)
	return character
end

function pigo:setWorld(worldDef)
	world = worldDef
end
--[[
function pigo:onEnterFrame()
	if obstacles ~= nil then
		for body,sprite in pairs(obstacles) do
			sprite:setPosition(body:getPosition())
			sprite:setRotation(body:getAngle() * 180 / math.pi)
		end
	end
end
]]--