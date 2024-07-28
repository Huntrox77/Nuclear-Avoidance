extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass


func _on_pressed():
	# Code to change the scene to the game.
	if name == "Back Button":
		get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")
	if name == "Back2Modifiers":
		get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
	pass # Replace with function body.
