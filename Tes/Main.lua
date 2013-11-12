application:setKeepAwake(true)
application:setOrientation("portrait")
application:setLogicalDimensions(320, 480)

require "accelerometer"

rute = {}
yy = {}
local x
local y

local function initObject()

	player = Bitmap.new(Texture.new("res/pigo.png"))
	rute[1] = Bitmap.new(Texture.new("res/track1.png"))
	rute[2] = Bitmap.new(Texture.new("res/track2.png"))
	rute[3] = Bitmap.new(Texture.new("res/track3.png"))
	rute[4] = Bitmap.new(Texture.new("res/track4.png"))
	rute[5] = Bitmap.new(Texture.new("res/track5.png"))
	rute[6] = Bitmap.new(Texture.new("res/track1.png"))
	
	for i=1,6 do
		rute[i].xdirection = 0
		rute[i].ydirection = 1
		rute[i].xspeed = 0
		rute[i].yspeed = 3
		stage:addChild(rute[i])
	end
	
	stage:addChild(player)
	
	rute[1]:setY(0)
	rute[2]:setY(105)
	rute[3]:setY(2*105)
	rute[4]:setY(3*105)
	rute[5]:setY(4*105)
	rute[6]:setY(-105)

	for i=1,6 do
		yy[i] = rute[i]:getY()	
	end
	
	x = player:getX()
	y = player:getY()

	x = 140
	y = 360
end

--[[
rute1.xdirection = 0
rute1.ydirection = 1
rute1.xspeed = 0
rute1.yspeed = 3


rute2.xdirection = 0
rute2.ydirection = 1
rute2.xspeed = 0
rute2.yspeed = 3

rute3.xdirection = 0
rute3.ydirection = 1
rute3.xspeed = 0
rute3.yspeed = 3

rute4.xdirection = 0
rute4.ydirection = 1
rute4.xspeed = 0
rute4.yspeed = 3

rute5.xdirection = 0
rute5.ydirection = 1
rute5.xspeed = 0
rute5.yspeed = 3

rute6.xdirection = 0
rute6.ydirection = 1
rute6.xspeed = 0
rute6.yspeed = 3


stage:addChild(rute1)
stage:addChild(rute2)
stage:addChild(rute3)
stage:addChild(rute4)
stage:addChild(rute5)
stage:addChild(rute6)
--]]


--stage:addChild(player)

--nyoba : gbr 1-2-3-4-5

--[[
rute1:setY(0)
rute2:setY(105)
rute3:setY(2*105)
rute4:setY(3*105)
rute5:setY(4*105)
rute6:setY(-105)
--]]

--[[
local yy1 = rute1:getY()	

local yy2 = rute2:getY()	
local yy3 = rute3:getY()	
local yy4 = rute4:getY()	
local yy5 = rute5:getY()	
local yy6 = rute6:getY()	
--]]

--[[
local x = player:getX()
local y = player:getY()

--cuma boleh di antara 60 - 210, posisi defaultnya 140
x = 140
y = 360
--]]

accelerometer:start()

--[[
print(yy1)
print(yy2)
print(yy3)
print(yy4)
print(yy5)
print(yy6)
--]]

function onEnterFrame(event)
    
	for i=1,6 do
		yy[i] =  yy[i] + (rute[i].yspeed * rute[i].ydirection)
		
		if yy[i] < 0 then
			rute[i].ydirection = 1
		end
		
	end

--[[
	yy1 = yy1 + (rute1.yspeed * rute1.ydirection)
	yy2 = yy2 + (rute2.yspeed * rute2.ydirection)
	yy3 = yy3 + (rute3.yspeed * rute3.ydirection)
	yy4 = yy4 + (rute4.yspeed * rute4.ydirection)
	yy5 = yy5 + (rute5.yspeed * rute5.ydirection)
	yy6 = yy6 + (rute6.yspeed * rute6.ydirection)
--]]

--[[
	if yy1 < 0 then
       rute1.ydirection = 1
    end

	if yy2 < 0 then
       rute2.ydirection = 1
    end

	if yy3 < 0 then
       rute3.ydirection = 1
    end

	if yy4 < 0 then
       rute4.ydirection = 1
    end

	if yy5 < 0 then
       rute5.ydirection = 1
    end

	if yy6 < 0 then
       rute6.ydirection = 1
    end
--]]
	player:setX(x)
    player:setY(y)
	
	for i=1,6 do
		rute[i]:setY(yy[i])
	end
--[[
	rute1:setY(yy1)
	rute2:setY(yy2)
	rute3:setY(yy3)
	rute4:setY(yy4)
	rute5:setY(yy5)
	rute6:setY(yy6)
--]]

	for i=1, 4 do
		if yy[i] > 480  then
			yy[i] = -rute[i+1]:getHeight()  
			rute[i]:setY(yy[i])
		end
	end

--[[
	if yy1 > 480  then
		yy1 = -rute2:getHeight()  
		rute1:setY(yy1)
	end

	if yy2 > 480  then
		yy2 = -rute3:getHeight()  
		rute2:setY(yy2)
	end
	
	if yy3 > 480  then
		yy3 = -rute4:getHeight()  
		rute3:setY(yy3)
	end

	if yy4 > 480  then
		yy4 = -rute5:getHeight()  
		rute4:setY(yy4)
	end
--]]

	if yy[5] > 480 then
		yy[5] = -rute[1]:getHeight()  
		rute[5]:setY(yy[5])
	end
	
	if yy[6] > 480 then
		yy[6] = -rute[1]:getHeight()  
		rute[6]:setY(yy[6])
	end


end

initObject()
stage:addEventListener(Event.ENTER_FRAME, onEnterFrame)

