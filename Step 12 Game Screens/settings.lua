local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local db = require("mydata")

-- local variables
local player1TextField
local player2TextField

local function pressMainMenuButton(event)
	if event.phase == "ended" then
		player1TextField:removeSelf()
		player2TextField:removeSelf()
		local player1Name = player1TextField.text
		if player1Name == "" then
			db.player1.name = "Player X"
		else
			db.player1.name = player1Name
		end
		local player2Name = player2TextField.text
		if player2Name == "" then
			db.player2.name = "Player Y"
		else
			db.player2.name = player2Name
		end
		storyboard.gotoScene("menu")
	end
end

function pressBackground(event)
	native.setKeyboardFocus(nil)
end

-- Storyboard Methods
function scene:createScene(event)
	local group = self.view
	local w = display.viewableContentWidth
	local h = display.viewableContentHeight
	local background = display.newRect(0, 0, w, h)
	background:setFillColor(0,0,0)
	local title = display.newText("Settings Screen", display.contentCenterX, 64, native.SystemFont, 40)
	local player1TextFieldLabel = display.newText("Player 1's Name", display.contentCenterX, 128, native.SystemFont, 32)
	local player2TextFieldLabel = display.newText("Player 2's Name", display.contentCenterX, 236, native.SystemFont, 32)
	background:addEventListener("touch", pressBackground)
	local goBackToMenuButton = widget.newButton {
		id = "MainMenuButton",
		defaultFile = "buttonBlue.png",
		overFile = "buttonBlueOver.png",
		label = "Go Back To Main Menu",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressMainMenuButton,
		x = 160,
		y = 364
	}
	group:insert(background)
	group:insert(title)
	group:insert(goBackToMenuButton)
	group:insert(player1TextFieldLabel)
	group:insert(player2TextFieldLabel)
end

function scene:enterScene(event)
	local group = self.view
	player1TextField = native.newTextField(160, 172, 280, 48)
	player2TextField = native.newTextField(160, 280, 280, 48)
	group:insert(player1TextField)
	group:insert(player2TextField)
end
	
scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)

return scene