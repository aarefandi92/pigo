HUDGem = Core.class(Sprite)

function HUDGem:init(val)
	self.val = val
	local gemIcon = Bitmap.new(Texture.new("res/gem.png"))
	gemIcon:setPosition(220, 10)
	self:addChild(gemIcon)
	local font = TTFont.new("res/fonts/PoetsenOne-Regular.otf", 15, false)
	self.textfield = TextField.new(font, val)
	self.textfield:setPosition(245, 30)
	self:addChild(self.textfield)
end

function HUDGem:setText(val)
	self.textfield:setText(val)
end