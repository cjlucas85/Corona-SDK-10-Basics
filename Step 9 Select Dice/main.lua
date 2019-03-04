local widget = require("widget")

-- SETUP DICE

local dice_sheet_options = {width=64, height=64, numFrames=12}
local dice_sheet = graphics.newImageSheet("Dice.png", dice_sheet_options)
local roll_sequence = {
	{ name = "roll", start=1, count=6, time=250, loopCount=4},
	{ name = "false", start=1, count=6, time=0, loopCount=0},
	{ name = "true", start=7, count=6, time=0, loopCount=0}
}
local die1 = display.newSprite(dice_sheet, roll_sequence)
local die2 = display.newSprite(dice_sheet, roll_sequence)
local die3 = display.newSprite(dice_sheet, roll_sequence)
local die4 = display.newSprite(dice_sheet, roll_sequence)
local die5 = display.newSprite(dice_sheet, roll_sequence)
local die6 = display.newSprite(dice_sheet, roll_sequence)
die1.x = 160 - 64
die1.y = 64
die2.x = 160
die2.y = 64
die3.x = 160 + 64
die3.y = 64
die4.x = 160 - 64
die4.y = 128
die5.x = 160
die5.y = 128
die6.x = 160 + 64
die6.y = 128
local dice = {[1]=die1, [2]=die2, [3]=die3, [4]=die4, [5]=die5, [6]=die6}

function tapDie(event)
	local thisDie = event.target
	if (event.phase == "ended") and not thisDie.isPlaying then
		thisDie.selected = not thisDie.selected
		thisDie:setSequence(tostring(thisDie.selected))
		thisDie:setFrame(thisDie.rolledValue)
	end
end

function rollDie(event) 
	if (event.phase == "ended") then
		local rolledValue = math.random(1, 6)
		local thisDie = event.target
		thisDie.rolledValue = rolledValue
		thisDie:setSequence("false")
		thisDie:setFrame(rolledValue)
		
	end
end

function rollAllDice()
	for i=1, 6, 1 do
		if not dice[i].selected then 
			dice[i]:setSequence("roll")
			dice[i]:play()
		end
	end
end

function initDice() 
	for i=1, 6, 1 do
		dice[i].selected = false
		dice[i]:addEventListener("sprite", rollDie)
		dice[i]:addEventListener("touch", tapDie)
	end
	rollAllDice()
end

-- SETUP ROLL BUTTON

function pressRollAllDiceButton(event)
	if (event.phase == "ended") then
		rollAllDice()
	end
end

local button = widget.newButton {
	id = "RollButton",
	defaultFile = "buttonBlue.png",
	overFile = "buttonBlueOver.png",
	label = "Roll All Dice",
	labelColor = {default = {50, 50, 50, 255}},
	font = "Verdana",
	fontSize = 22,
	emboss = true,
	onEvent= pressRollAllDiceButton,
	x = 160,
	y = 192 + 16
}

-- INITIALIZE

initDice()
