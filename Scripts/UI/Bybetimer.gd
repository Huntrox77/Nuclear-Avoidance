extends Timer
@onready var Modifier = get_node("/root/Modifiers")
var text = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# when timer out send players back to modifiers screen
func _process(_delta):
	$Label.text = str(text)
	if text == 0:
		Modifier.players_left = 0
		Modifier._reset()
		if Modifier.Challenge_Or_Local == "local":
			get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
		elif Modifier.Challenge_Or_Local == "Challenge":
			get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")


func _on_timeout():
	text -= 1
