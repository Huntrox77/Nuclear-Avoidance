extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass


func _on_pressed():
	# Code to change the scene to the game.
	if name == "Play Button":
		get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
	if name == "Challenges":
		get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
	pass # Replace with function body.
