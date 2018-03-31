IsometricEngine.Camera = createClass()
local Camera = IsometricEngine.Camera

Camera.load = function(self)
	self.cs = self.engine.cs
	
	self.x = 0
	self.y = 0
	self.z = 0
	self.r = 16
	
	self.cursorx = 0
	self.cursory = 0
	self.cursorz = 0
	
	self.one = 128
	
	self:setCallbacks()
	
	self.loaded = true
end

Camera.setCallbacks = function(self)
	soul.setCallback("mousemoved", self, function(x, y)
		self.cursorx, self.cursory = self:projectBack(x, y, self.cursorz)
	end)
	soul.setCallback("wheelmoved", self, function(_, d)
		self.cursorz = self.cursorz + d
		self.cursorx, self.cursory = self:projectBack(love.mouse.getX(), love.mouse.getY(), self.cursorz)
	end)
end

Camera.unsetCallbacks = function(self)
	soul.unsetCallback("mousemoved", self)
	soul.unsetCallback("wheelmoved", self)
end

Camera.update = function(self)
end

Camera.unload = function(self)
	self:unsetCallbacks()
	
	self.loaded = false
end

Camera.project = function(self, x, y, z)
	local x = x + self.x
	local y = y + self.y
	local z = z + self.z
	
	return
		(y - x - 1) * self.one / 2  + self.cs:X(0.5),
		(x + y - 2 * (z + 1)) * self.one / 4 + self.cs:Y(0.5)
end

Camera.projectBack = function(self, X, Y, z)
	return
		math.floor((Y - self.cs:Y(0.5, true)) * 2 / self.one - (X - self.cs:X(0.5, true)) / self.one + z),
		math.floor((X - self.cs:X(0.5, true)) / self.one + (Y - self.cs:Y(0.5, true)) * 2 / self.one + z)
end

