local storyboard = require("storyboard")
local widget = require("widget")
local db = require("mydata")
local scene = storyboard.newScene()

-- local variables
local h = display.contentHeight
local w = display.contentWidth

local function pressPlayGameButton(event)
	if event.phase == "ended" then
		db.player1.score = 0
		db.player2.score = 0
		db.isPlayer1Turn = true
		storyboard.gotoScene("game")
	end
end

local function pressSettingsButton(event)
	if event.phase == "ended" then
		storyboard.gotoScene("settings")
	end
end

local function pressExitButton(event)
	if event.phase == "ended" then
		os.exit()
	end
end


-- Storyboard Methods
function scene:createScene(event)
	local group = self.view
	
	local title = display.newText("Zilch!", display.contentCenterX, 64, native.SystemFont, 40)
	
	local playGameButton = widget.newButton {
		id = "PlayGameButton",
		defaultFile = "buttonBlue.png",
		overFile = "buttonBlueOver.png",
		label = "Play Game",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressPlayGameButton,
		x = 160,
		y = 128
	}
	
	local settingsButton = widget.newButton {
		id = "SettingsButton",
		defaultFile = "buttonBlue.png",
		overFile = "buttonBlueOver.png",
		label = "Settings",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressSettingsButton,
		x = 160,
		y = 128 + 64
	}
	
	local exitButton = widget.newButton {
		id = "ExitButton",
		defaultFile = "buttonRed.png",
		overFile = "buttonRedOver.png",
		label = "Exit",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressExitButton,
		x = 160,
		y = h - 32
	}
	
	group:insert(title)
	group:insert(playGameButton)
	group:insert(settingsButton)
	group:insert(exitButton)
end

scene:addEventListener("createScene", scene)

return scene