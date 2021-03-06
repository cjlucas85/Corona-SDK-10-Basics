local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local db = require("mydata")

-- local variables

local title

local function pressEndTurnButton(event)
	if event.phase == "ended" then
		db.isPlayer1Turn = not db.isPlayer1Turn
		storyboard.gotoScene("game")
	end
end

local function pressQuitGameButton(event)
	if event.phase == "ended" then
		storyboard.gotoScene("menu")
	end
end

-- Storyboard Methods
function scene:createScene(event)
	local group = self.view
	
	if db.isPlayer1Turn then
		title = display.newText(db.player1.name .. "'s Turn", display.contentCenterX, 64, native.SystemFont, 40)
	else
		title = display.newText(db.player2.name .. "'s Turn", display.contentCenterX, 64, native.SystemFont, 40)
	end
	
	local endTurnButton = widget.newButton {
		id = "EndTurnButton",
		defaultFile = "buttonBlue.png",
		overFile = "buttonBlueOver.png",
		label = "End Turn",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressEndTurnButton,
		x = 160,
		y = 128
	}
	
	local quitGameButton = widget.newButton {
		id = "QuitGameButton",
		defaultFile = "buttonRed.png",
		overFile = "buttonRedOver.png",
		label = "Quit Game",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressQuitGameButton,
		x = 160,
		y = display.contentHeight - 32
	}
	
	group:insert(title)
	group:insert(endTurnButton)
	group:insert(quitGameButton)
end

function scene:enterScene(event)
	if db.isPlayer1Turn then
		title.text = db.player1.name .. "'s Turn"
	else
		title.text = db.player2.name .. "'s Turn"
	end
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)

return scene