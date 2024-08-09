extends Node
@onready var Modifier = get_node("/root/Modifiers")
@onready var Saves = get_node("/root/KeepBetweenSaves")
var timeleft = 45
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_counter_timer_timeout():
	timeleft -= 1
	$RichTextLabel.text = "Time Left: " + str(timeleft)
	pass # Replace with function body.


func _on_time_2_survive_timeout():
	get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
	Modifier.ChallengeOrLocal = "Local"
	Saves.ChallengeOneComplete = true
	pass # Replace with function body.
