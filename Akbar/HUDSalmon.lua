HUDSalmon = Core.class(Sprite)

function HUDSalmon:init(val)
	self.val = val
	local salmonIcon = Bitmap.new(Texture.new("res/salmon.png"))
	salmonIcon:setPosition(60, 10)
	self:addChild(salmonIcon)
	local font = TTFont.new("res/fonts/PoetsenOne-Regular.otf", 15, false)
	self.textfield = TextField.new(font, val)
	self.textfield:setPosition(80, 30)
	self:addChild(self.textfield)
end

function HUDSalmon:setText(val)
	self.textfield:setText(val)
end