local widget = require("widget")



-- SETUP DIE
local dice_sheet_options = {
	width=64, 
	height=64, 
	numFrames=6
}
local dice_sheet = graphics.newImageSheet("Dice.png", dice_sheet_options)
local roll_sequence = {
	{name = "roll", start=1, count=6, time=800, loopCount=3}
}
local die = display.newSprite(dice_sheet, roll_sequence)
die.x = 160
die.y = 0
die:setSequence("roll")

function rollDie(event) 
	if (event.phase == "ended") then
		thisSprite = event.target
		thisSprite:setFrame(math.random(6))
	end
end

die:play()
die:addEventListener("sprite", rollDie)



-- SETUP ROLL BUTTON

function buttonPress(event)
	die:setSequence("roll")
	die:play()
end

local button = widget.newButton
{
	id = "RollButton",
	defaultFile = "buttonBlue.png",
	overFile = "buttonBlueOver.png",
	label = "Roll Die",
	labelColor = {default = {50, 50, 50, 255}},
	font = "Trebuchet-Bold",
	fontSize = 22,
	emboss = true,
	onEvent= buttonPress
}
button.x = 160
button.y = 128