distance = Core.class(Sprite)

function distance:init(val)
	self.val = val
	local font = TTFont.new("res/fonts/PoetsenOneRegular.otf", 24, false)
	self.textfield = TextField.new(font, "DISTANCE ")
	self.textfield:setTextColor(0x999999)
	self.textfield:setPosition(100, 23)
	self:addChild(self.textfield)
	
	local font2 = TTFont.new("res/fonts/PoetsenOneRegular.otf", 24, false)
	self.textfield2 = TextField.new(font2, val.."m")
	self.textfield2:setPosition(140, 46)
	self.textfield2:setTextColor(0x0000ff)
	self:addChild(self.textfield2)
	
	
end

function distance:setText(val)
	self.textfield2:setText(val.." m")
	--print(val)
end