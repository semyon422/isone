IsometricEngine.World = createClass()
local World = IsometricEngine.World

World.load = function(self)
	self.map = {
		{
			{
				1, 1, 29,
			},
			{
				1, 1, 1,
			},
			{
				1, 1, 1,
			},
		},
		{
			{
				1, 1, 15,
			},
			{
				1, 1, 10,
			},
			{
				1, 1, 0,
			},
		},
		{
			{
				1, 1, 13,
			},
			{
				1, 50, 0,
			},
			{
				1, 0, 0,
			},
		},
	}
	
	self.loaded = true
end

World.getMap = function(self)
	return self.map
end

World.update = function(self)
end

World.unload = function(self)
	
	self.loaded = false
end