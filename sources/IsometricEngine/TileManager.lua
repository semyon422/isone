IsometricEngine.TileManager = createClass()
local TileManager = IsometricEngine.TileManager

TileManager.load = function(self)
	self.cs = self.engine.cs
	
	self.image = love.graphics.newImage("img/basic_ground_tiles.png")
	
	self.tileWidth = 128
	self.tileHeight = 128
	
	self.quads = {}
	for y = 0, self.image:getHeight() - self.tileHeight, self.tileHeight do
		for x = 0, self.image:getWidth() - self.tileWidth, self.tileWidth do
			table.insert(
				self.quads,
				love.graphics.newQuad(x, y, self.tileWidth, self.tileHeight, self.image:getWidth(), self.image:getHeight())
			)
		end
	end
	
	self.loaded = true
end

TileManager.getImage = function(self)
	return self.image
end

TileManager.getQuad = function(self, quadIndex)
	return self.quads[quadIndex]
end

TileManager.getTileWidth = function(self)
	return self.tileWidth
end

TileManager.getTileHeight = function(self)
	return self.tileHeight
end

TileManager.update = function(self)
end

TileManager.unload = function(self)
	
	self.loaded = false
end