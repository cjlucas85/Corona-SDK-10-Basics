local storyboard = require("storyboard")
local db = require("mydata")
db.player1 = {}
db.player1.score = 0
db.player1.name = "Player 1"
db.player2 = {}
db.player2.score = 0
db.player2.name = "Player 2"
db.isPlayer1Turn = true
display.setStatusBar(display.HiddenStatusBar)
storyboard.gotoScene("menu")
