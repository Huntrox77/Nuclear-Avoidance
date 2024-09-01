extends Node
var config = ConfigFile.new()
var TextSpeed = 0
var player1con = []
var player2con = []
var player3con = []
var player4con = []
var ChallengeOneComplete = false
var ChallengeTwoComplete = false
var achievements = []

# Called when the node enters the scene tree for the first time.
func _ready():
	config.load("res://config.cfg")
	TextSpeed = config.get_value("Textspeed", "Choice") 
	player1con = config.get_value("PlayerOne", "Controls") 
	ChallengeOneComplete = config.get_value("Achivements", "Completed")[0] 
	ChallengeTwoComplete = config.get_value("Achivements", "Completed")[1]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	achievements = [ChallengeOneComplete, ChallengeTwoComplete]
	config.set_value("Textspeed", "Choice", TextSpeed) 
	config.set_value("PlayerOne", "Controls", player1con)
	config.set_value("Achivements", "Completed", achievements) 
	_save()
	pass


func _save():
	config.save("res://config.cfg")
