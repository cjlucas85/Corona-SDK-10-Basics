local dice_sheet_options = {
	width=64, 
	height=64, 
	numFrames=6
}
local dice_sheet = graphics.newImageSheet("Dice.png", dice_sheet_options)
local roll_sequence = { 
	{name = "roll", start=1, count=6, time=800, loopCount=3},
	{name = "roll2", start=10, count=6, time=800, loopCount=3}
}
local die = display.newSprite(dice_sheet, roll_sequence)
die.x = 100
die.y = 100
die:setSequence("roll")

function rollDie(event) 
	if (event.phase == "ended") then
		thisSprite = event.target
		thisSprite:setFrame(math.random(6))
	end
end

die:play()
die:addEventListener("touch", rollDie)
