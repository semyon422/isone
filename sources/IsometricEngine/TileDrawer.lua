IsometricEngine.TileDrawer = createClass()
local TileDrawer = IsometricEngine.TileDrawer

TileDrawer.load = function(self)
	self.cs = self.engine.cs
	self.spriteBatch = love.graphics.newSpriteBatch(self.engine.tileManager:getImage())
	
	self.drawableObject = soul.graphics.Drawable:new({
		drawable = self.spriteBatch,
		layer = 2,
		cs = self.cs,
		x = 0,
		y = 0,
		sx = 1,
		sy = 1
	})
	self.drawableObject:activate()
	
	self.loaded = true
end

TileDrawer.update = function(self)
	self.spriteBatch:clear()
	local map = self.engine.world:getMap()
	local cx, cy, cz, r = self.engine.camera.x, self.engine.camera.y, self.engine.camera.z, self.engine.camera.r 
	local csx, csy, csz = self.engine.camera.cursorx, self.engine.camera.cursory, self.engine.camera.cursorz
	for x = cx - r, cx + r do
		for y = cy - r, cy + r do
			for z = cz - r, cz + r do
				if map[x] and map[x][y] and map[x][y][z] and self.engine.tileManager:getQuad(map[x][y][z]) then
					self.spriteBatch:add(self.engine.tileManager:getQuad(map[x][y][z]), self.engine.camera:project(x, y, z))
				end
				if csx == x and csy == y and csz == z then
					self.spriteBatch:add(self.engine.tileManager:getQuad(56), self.engine.camera:project(x, y, z))
				end
			end
		end
	end
end

TileDrawer.unload = function(self)
	self.drawableObject:deactivate()
	
	self.loaded = false
end