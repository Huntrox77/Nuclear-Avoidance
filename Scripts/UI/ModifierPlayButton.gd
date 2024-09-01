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
			Modifier.currentmap = "map1"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay.tscn")
			Modifier.map1 = false
			Modifier.gameplaying = true
			Modifier.resmap1 = true
		elif Modifier.map2 == true:
			Modifier.currentmap = "map2"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
			Modifier.map2 = false
			Modifier.gameplaying = true
			Modifier.resmap2 = true
		elif Modifier.map3 == true:
			Modifier.currentmap = "map3"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay3.tscn")
			Modifier.map3 = false
			Modifier.gameplaying = true
			Modifier.resmap3 = true
		elif Modifier.map4 == true:
			Modifier.currentmap = "map4"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay4.tscn")
			Modifier.map4 = false
			Modifier.gameplaying = true
			Modifier.resmap4 = true
		elif Modifier.map5 == true:
			Modifier.currentmap = "map5"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay5.tscn")
			Modifier.map5 = false
			Modifier.gameplaying = true
			Modifier.resmap5 = true
		elif Modifier.map6 == true:
			Modifier.currentmap = "map6"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay6.tscn")
			Modifier.map6 = false
			Modifier.gameplaying = true
			Modifier.resmap6 = true
