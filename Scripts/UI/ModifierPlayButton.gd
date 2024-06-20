extends Button
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

	# Code to change the scene to the game.
func _on_pressed():
	if Modifier.playersleft == 0:
		pass
	else:
		if Modifier.map1 == true:
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay.tscn")
			Modifier.map1 = false
			Modifier.gameplaying = true
		elif Modifier.map2 == true:
			Modifier.currentmap = "map2"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
			Modifier.map2 = false
			Modifier.gameplaying = true
