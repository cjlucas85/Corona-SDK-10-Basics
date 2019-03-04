local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local db = require("mydata")

-- local variables
local h = display.contentHeight
local w = display.contentWidth

local player1TextField
local player2TextField

local function pressApplyButton(event)
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

local function pressCancelButton(event)
	if event.phase == "ended" then
		storyboard.gotoScene("menu")
	end
end

local function pressBackground(event)
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
	local player1TextFieldLabel = display.newText("Player 1's Name", display.contentCenterX, 128, native.SystemFont, 28)
	local player2TextFieldLabel = display.newText("Player 2's Name", display.contentCenterX, 216, native.SystemFont, 28)
	background:addEventListener("touch", pressBackground)
	local applyButton = widget.newButton {
		id = "ApplyButton",
		defaultFile = "buttonBlue.png",
		overFile = "buttonBlueOver.png",
		label = "Apply",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressApplyButton,
		x = 160,
		y = 324
	}
	local cancelButton = widget.newButton {
		id = "CancelButton",
		defaultFile = "buttonRed.png",
		overFile = "buttonRedOver.png",
		label = "Cancel",
		labelColor = { default = {50, 50, 50, 255} },
		font = "Verdana",
		fontSize = 22,
		emboss = true,
		onEvent = pressCancelButton,
		x = 160,
		y = h - 32
	}
	
	group:insert(background)
	group:insert(title)
	group:insert(applyButton)
	group:insert(cancelButton)
	group:insert(player1TextFieldLabel)
	group:insert(player2TextFieldLabel)
end

function scene:enterScene(event)
	local group = self.view
	player1TextField = native.newTextField(160, 172, 280, 40)
	player2TextField = native.newTextField(160, 260, 280, 40)
	group:insert(player1TextField)
	group:insert(player2TextField)
end
	
scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)

return scene