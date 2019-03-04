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
local die1 = display.newSprite(dice_sheet, roll_sequence)
local die2 = display.newSprite(dice_sheet, roll_sequence)
local die3 = display.newSprite(dice_sheet, roll_sequence)
local die4 = display.newSprite(dice_sheet, roll_sequence)
local die5 = display.newSprite(dice_sheet, roll_sequence)
local die6 = display.newSprite(dice_sheet, roll_sequence)
die1.x = 160 - 64
die1.y = 0
die2.x = 160
die2.y = 0
die3.x = 160 + 64
die3.y = 0
die4.x = 160 - 64
die4.y = 64
die5.x = 160
die5.y = 64
die6.x = 160 + 64
die6.y = 64
local dice = {[1]=die1, [2]=die2, [3]=die3, [4]=die4, [5]=die5, [6]=die6}

function rollDie(event) 
	if (event.phase == "ended") then
		local rolled = math.random(1, 6)
		local thisSprite = event.target
		thisSprite:setFrame(rolled)
	end
end

function rollAllDice()
	for i=1, 6, 1 do
		dice[i]:setSequence("roll")
		dice[i]:play()
		dice[i]:addEventListener("sprite", rollDie)
	end
end

rollAllDice()


-- SETUP ROLL BUTTON

function buttonPress(event)
	if (event.phase == "ended") then
		rollAllDice()
	end
end

local button = widget.newButton
{
	id = "RollButton",
	defaultFile = "buttonBlue.png",
	overFile = "buttonBlueOver.png",
	label = "Roll All Dice",
	labelColor = {default = {50, 50, 50, 255}},
	font = "Trebuchet-Bold",
	fontSize = 22,
	emboss = true,
	onEvent= buttonPress
}
button.x = 160
button.y = 128 + 16
