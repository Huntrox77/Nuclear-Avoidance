extends Node
@onready var Modifier = get_node("/root/Modifiers")
@onready var Saves = get_node("/root/ConfigScript")
var timeleft = null
# Called when the node enters the scene tree for the first time.
func _ready():
	#Timers & Modifiers
	if name == "Timers":
		timeleft = 45
	elif name == "Timers2":
		timeleft = 60
	elif name == "Timers3":
		timeleft = 30
		Modifier.Crumble = true
	elif name == "Timers4":
		timeleft = 60


func _process(_delta):
	Modifier.playersleft = 1
	Modifier.gameplaying = true
	Modifier.ChallengeOrLocal = "Challenge"
	pass


func _on_counter_timer_timeout():
	timeleft -= 1
	$RichTextLabel.text = "Time Left: " + str(timeleft)
	pass # Replace with function body.


func _on_time_2_survive_timeout():
	Modifier.ChallengeOrLocal = "local"
	Modifier._reset()
	if name == "Timers":
		Saves.ChallengeOneComplete = true
	elif name == "Timers2":
		Saves.ChallengeTwoComplete = true
	elif name == "Timers3":
		Saves.ChallengeThreeComplete = true
	elif name == "Timers4":
		Saves.ChallengeFourComplete = true
	get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
