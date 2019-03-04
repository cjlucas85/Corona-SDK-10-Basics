local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local db = require("mydata")

-- local variables

local function pressMainMenuButton(event)
	if event.phase == "ended" then
		storyboard.gotoScene("menu")
	end
end

-- Storyboard Methods
function scene:createScene(event)
	local group = self.view
	local title
	if db.isPlayer1Turn then
		print "Something"
		title = display.newText(db.player1.name, display.contentCenterX, 64, native.SystemFont, 40)
	else
		print "Something Else"
		title = display.newText(db.player2.name, display.contentCenterX, 64, native.SystemFont, 40)
	end
	
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
		y = 128
	}
	
	group:insert(title)
	group:insert(goBackToMenuButton)
end

scene:addEventListener("createScene", scene)

return scene