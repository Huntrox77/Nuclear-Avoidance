extends Timer
@onready var Modifier = get_node("/root/Modifiers")
var text = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = str(text)
	if text == 0:
		Modifier.playersleft = 0
		Modifier._reset()
		if Modifier.ChallengeOrLocal == "local":
			get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
		elif Modifier.ChallengeOrLocal == "Challenge":
			get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")


func _on_timeout():
	text -= 1
