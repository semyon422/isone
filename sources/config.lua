stateManager = StateManager:new()

globalKeyBindManager = KeyBindManager:new()
globalKeyBindManager:activate()
globalKeyBindManager:setBinding("escape", function() stateManager:switchState("mainMenu") _G.unloadEngine() end, nil, true)

local background = BackgroundManager:new({
	drawable = love.graphics.newImage("resources/background.jpg")
})

mainFont20 = love.graphics.newFont("resources/NotoSansCJK-Regular.ttc", 20)
mainFont30 = love.graphics.newFont("resources/NotoSansCJK-Regular.ttc", 30)

local button = soul.ui.RectangleTextButton:new({
	x = 0.4, y = 0.4, w = 0.2, h = 0.2,
	layer = 2,
	cs = soul.CS:new(nil, 0.5, 0.5, 0.5, 0.5, "h", 600),
	text = "play",
	textColor = {255, 255, 255, 255},
	rectangleColor = {255, 255, 255, 15},
	mode = "fill",
	limit = 0.2,
	textAlign = {
		x = "center", y = "center"
	},
	action = function() stateManager:switchState("playing") end,
	font = mainFont30
})


loadEngine = function(directoryPath, fileName)
	engine = IsometricEngine:new()
	engine:activate()
end

unloadEngine = function()
	engine:deactivate()
end

stateManager:setState(
	StateManager.State:new(
		{
			background,
			button
		},
		{
		
		}
	),
	"mainMenu"
)
stateManager:setState(
	StateManager.State:new(
		function()
			loadEngine()
		end,
		{
			button
		}
	),
	"playing"
)

stateManager:switchState("mainMenu")
