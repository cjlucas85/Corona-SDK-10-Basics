local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local db = require("mydata")

-- local variables
local h = display.contentHeight
local w = display.contentWidth

local takeTurnButton
local player1Score
local player2Score

local function pressTakeTurnButton(event)
	if event.phase == "ended" then
		storyboard.gotoScene("turn")
	end
end

local function pressQuitGameButton(event)
	if event.phase == "ended" then
		storyboard.gotoScene("menu")
	end
end

local function getPlayer1Score()
	return db.player1.name .. ": " .. db.player1.score
end

local function getPlayer2Score()
	return db.player2.name .. ": " .. db.player1.score
end

local function leftAlignLabel()
	return (display.contentCenterX / 2) + 20
end

-- Storyboard Methods
function scene:createScene(event)
	local group = self.view
	local title = display.newText("Zilch!", display.contentCenterX, 64, native.SystemFont, 40)
	player1Score = display.newText(getPlayer1Score(), leftAlignLabel(), 118, native.SystemFont, 28)
	player2Score = display.newText(getPlayer2Score(), leftAlignLabel(), 158, native.SystemFont, 28)
	takeTurnButton = widget.newButton {
		id = "TakeTurnButton",
		defaultFile = "buttonBlue.png",
		overFile = "buttonBlueOver.png",
		label = db.player1.name .. "'s Turn",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressTakeTurnButton,
		x = 160,
		y = 220
	}
	
	local quitGameButton = widget.newButton {
		id = "quitGameButton",
		defaultFile = "buttonRed.png",
		overFile = "buttonRedOver.png",
		label = "Quit Game",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressQuitGameButton,
		x = 160,
		y = h - 32
	}
	
	group:insert(title)
	group:insert(player1Score)
	group:insert(player2Score)
	group:insert(quitGameButton)
	group:insert(takeTurnButton)
end

function scene:enterScene(event)
	player1Score.text = getPlayer1Score()
	player2Score.text = getPlayer2Score()
	if db.isPlayer1Turn then
		takeTurnButton:setLabel("Begin " .. db.player1.name .. "'s Turn")
	else
		takeTurnButton:setLabel("Begin " .. db.player2.name .. "'s Turn")
	end
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)

return scene