extends Node
@onready var Modifier = get_node("/root/Modifiers")
@onready var Saves = get_node("/root/ConfigScript")
var time_left = null


# Sets the challenges time limit
func _ready():
	#Timers & Modifiers
	if name == "Timers":
		time_left = 45
	elif name == "Timers2":
		time_left = 60
	elif name == "Timers3":
		time_left = 30
		Modifier.Crumble = true
	elif name == "Timers4":
		time_left = 60


#sets the base data for the challenge
func _process(_delta):
	Modifier.players_left = 1
	Modifier.game_playing = true
	Modifier.Challenge_Or_Local = "Challenge"
	pass


# makes the timer time
func _on_counter_timer_timeout():
	time_left -= 1
	$RichTextLabel.text = "Time Left: " + str(time_left)
	pass # Replace with function body.


# Updates the achievemetns
func _on_time_2_survive_timeout():
	Modifier.Challenge_Or_Local = "local"
	Modifier._reset()
	if name == "Timers":
		Saves.Challenge_One_Complete = true
	elif name == "Timers2":
		Saves.Challenge_Two_Complete = true
	elif name == "Timers3":
		Saves.Challenge_Three_Complete = true
	elif name == "Timers4":
		Saves.Challenge_Four_Complete = true
	get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
