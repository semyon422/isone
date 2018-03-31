IsometricEngine = createClass(soul.SoulObject)

require("IsometricEngine.TileManager")
require("IsometricEngine.Camera")
require("IsometricEngine.TileDrawer")
require("IsometricEngine.World")

IsometricEngine.load = function(self)
	self.cs = soul.CS:new(nil, 0.5, 0.5, 0.5, 0.5, "h", 768)
	
	self.world = self.World:new()
	self.world.engine = self
	self.world:load()
	
	self.tileManager = self.TileManager:new()
	self.tileManager.engine = self
	self.tileManager:load()
	
	self.camera = self.Camera:new()
	self.camera.engine = self
	self.camera:load()
	
	self.tileDrawer = self.TileDrawer:new()
	self.tileDrawer.engine = self
	self.tileDrawer:load()
	
	self.loaded = true
end

IsometricEngine.update = function(self)
	self.camera:update()
	self.tileDrawer:update()
end

IsometricEngine.unload = function(self)
	self.camera:unload()
	self.tileDrawer:unload()
	
	self.loaded = false
end