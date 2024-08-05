extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass


func _on_pressed():
	# Code to change the scene to the game.
	get_tree().quit()
	pass # Replace with function body.


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")


func _on_achievments_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/achievements.tscn")
	pass # Replace with function body.
