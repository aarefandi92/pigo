acceloHandler = Core.class(Sprite)

-- include box2d
require "box2d"
b2.setScale(10)

-- include accelerometer
local accelerometer = Accelerometer.new()
accelerometer:start()


-- membuat actors
local actors = {}

--membuat object
local objectToMove = {}
local obstacles = {}
-- create world
local world

-- deskripsi
local fx
local xPosition

local initVeloX
local initVeloY
local body 
local stone
local body1
local obstacle
local rute = {}
local yy = {}
local jarak = 0
local dis = distance.new(jarak)
		

function acceloHandler:init()
	--fx untuk nilai pengubah posisi dari accelerometer
	fx = 0
	--xPosition nilai posisi setelah diubah berdasar accelerometer
	xPosition = 0

	-- mendapatkan screen width dan height
	screenHeight = application:getLogicalHeight()
	screenWidth = application:getLogicalWidth()

	--initial velocity
	initVeloX = 0
	initVeloY = 0

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
		rute[i].yspeed = 5
		stage:addChild(rute[i])
	end
	
	rute[1]:setY(0)
	rute[2]:setY(105)
	rute[3]:setY(2*105)
	rute[4]:setY(3*105)
	rute[5]:setY(4*105)
	rute[6]:setY(-105)
	
	for i=1,6 do
		yy[i] = rute[i]:getY()	
	end
		
	stage:addChild(dis)
end

function acceloHandler:setObstacles(obstacles)
	obstacles = obstacles
	
end

function acceloHandler:setObject(object)
	objectToMove = object
end

function acceloHandler:setWorld(worldRef)
	world = worldRef
end

--semakin besar gravity, semakin lambat
local function updateObject(gravity, xPosition)
	local x,y = body:getPosition()
	body:setPosition(xPosition,y)
	stone:setPosition(body:getPosition())
	local x,y = body1:getPosition()
	obstacle:setPosition(x,y)
end



-- update posisi setiap memasuki frame baru
local function onEnterFrame()
	-- setting physics
	world:step(1/60, 8, 3)	
	local xA, yA, zA = accelerometer:getAcceleration()
	--semakin kecil filter, maka pengambilan posisi accelerometer semakin smooh
	filter = 0.1
	-- pengambilan posisi dengan filter yang ada
	fx = xA * filter + fx * (1 - filter)
	--mendapatkan posisi relatif x terhadap layar
	xPosition = screenWidth/2 + fx * screenWidth
	
	--membatasai pergerakan sebatas lebar layar
	if xPosition < 0 then
		xPosition = 0
	elseif xPosition > (screenWidth) then
		xPosition = (screenWidth)
	end
	
	for body,sprite in pairs(obstacles) do
		local x,y = body:getPosition()
		sprite:setPosition(100,300)
	end
	
	--update objek yang akan diletakkan pada layar
	for body,sprite in pairs(objectToMove) do
		local x,y = body:getPosition()
		body:setPosition(xPosition,y)
		sprite:setPosition(body:getPosition())		
	end	
	
	for i=1,6 do
		yy[i] =  yy[i] + (rute[i].yspeed * rute[i].ydirection)
		
		if yy[i] < 0 then
			rute[i].ydirection = 1
		end
		
	end
	
	for i=1,6 do
		rute[i]:setY(yy[i])
	end
	
	for i=1, 4 do
		if yy[i] > 480  then
			yy[i] = -rute[i+1]:getHeight()  
			rute[i]:setY(yy[i])
			jarak = jarak +1
		dis:setText(jarak)
		end
	end

	if yy[5] > 480 then
		yy[5] = -rute[1]:getHeight()  
		rute[5]:setY(yy[5])
		jarak = jarak +1
		dis:setText(jarak)
	end
	
	if yy[6] > 480 then
		yy[6] = -rute[1]:getHeight()  
		rute[6]:setY(yy[6])
		jarak = jarak +1
		dis:setText(jarak)
	end
end

--meletakkan update posisi pada listener agar setiap frame diubah posisi juga diubah
stage:addEventListener(Event.ENTER_FRAME, onEnterFrame)

--stone:setRotation(body:getAngle() * 180 / math.pi)