worldManager = Core.class(Sprite)
local world = b2.World.new(0, 9.8)

function getWorld ()
	return world
end