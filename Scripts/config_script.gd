extends Node
@onready var Modifier = get_node("/root/Modifiers")
var config = ConfigFile.new()
var TextSpeed = 0
var player1con = []
var player2con = []
var player3con = []
var player4con = []
var Favourites = []
var HowManyPlayersLeftChoice = 1
var ChallengeOneComplete = false
var ChallengeTwoComplete = false
var ChallengeThreeComplete = false
var ChallengeFourComplete = false
var achievements = []
var InTimer = 0


func _ready():
	config.load("res://config.cfg")
	TextSpeed = config.get_value("Textspeed", "Choice") 
	player1con = config.get_value("PlayerOne", "Controls") 
	Favourites = config.get_value("Modifiers", "Favourited")
	InTimer = config.get_value("Timer", "Choice")
	HowManyPlayersLeftChoice = config.get_value("Playersleft", "Choice")
	ChallengeOneComplete = config.get_value("Achivements", "Completed")[0] 
	ChallengeTwoComplete = config.get_value("Achivements", "Completed")[1]
	ChallengeThreeComplete = config.get_value("Achivements", "Completed")[2]
	ChallengeFourComplete = config.get_value("Achivements", "Completed")[3]


func _process(_delta):
	achievements = [ChallengeOneComplete, ChallengeTwoComplete, ChallengeThreeComplete, ChallengeFourComplete]
	config.set_value("Textspeed", "Choice", TextSpeed) 
	config.set_value("PlayerOne", "Controls", player1con)
	config.set_value("Achivements", "Completed", achievements)
	config.set_value("Modifiers", "Favourited", Favourites)
	config.set_value("Timer", "Choice", InTimer)
	config.set_value("Playersleft", "Choice", HowManyPlayersLeftChoice)
	Modifier.InTimer = InTimer
	Modifier.HowManyPlayersLeftChoice = HowManyPlayersLeftChoice
	_save()


func _save():
	config.save("res://config.cfg")
