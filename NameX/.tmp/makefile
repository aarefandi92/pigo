LUAC = luac

all: .tmp/main.lua.bin .tmp/collisionHandler.lua.bin .tmp/acceloHandler.lua.bin .tmp/obstacleManager.lua.bin

.tmp/main.lua.bin: main.lua
	$(LUAC) -o ".tmp/main.lua.bin" "main.lua"

.tmp/collisionHandler.lua.bin: collisionHandler.lua
	$(LUAC) -o ".tmp/collisionHandler.lua.bin" "collisionHandler.lua"

.tmp/acceloHandler.lua.bin: acceloHandler.lua
	$(LUAC) -o ".tmp/acceloHandler.lua.bin" "acceloHandler.lua"

.tmp/obstacleManager.lua.bin: obstacleManager.lua
	$(LUAC) -o ".tmp/obstacleManager.lua.bin" "obstacleManager.lua"

