extends Button
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _playeralive():
	if Modifier.listofplayers[0] == true:
		Modifier.P1Alive = true
	if Modifier.listofplayers[1] == true:
		Modifier.P2Alive = true
	if Modifier.listofplayers[2] == true:
		Modifier.P3Alive = true
	if Modifier.listofplayers[3] == true:
		Modifier.P4Alive = true
	if Modifier.listofplayers[4] == true:
		Modifier.P5Alive = true


func countdown():
	Modifier.CountdownFinished = false
	Modifier.StartCountdown = true


	# Code to change the scene to the game.
func _on_pressed():
	if Modifier.playersleft == 0:
		pass
	else:
		Modifier.P1Points = 0
		Modifier.P2Points = 0
		Modifier.P3Points = 0
		Modifier.P4Points = 0
		Modifier.P5Points = 0
		if Modifier.map1 == true:
			Modifier.currentmap = "map1"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay.tscn")
			Modifier.map1 = false
			Modifier.gameplaying = true
			Modifier.resmap1 = true
			_playeralive()
			countdown()
		elif Modifier.map2 == true:
			Modifier.currentmap = "map2"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
			Modifier.map2 = false
			Modifier.gameplaying = true
			Modifier.resmap2 = true
			_playeralive()
			countdown()
		elif Modifier.map3 == true:
			Modifier.currentmap = "map3"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay3.tscn")
			Modifier.map3 = false
			Modifier.gameplaying = true
			Modifier.resmap3 = true
			_playeralive()
			countdown()
		elif Modifier.map4 == true:
			Modifier.currentmap = "map4"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay4.tscn")
			Modifier.map4 = false
			Modifier.gameplaying = true
			Modifier.resmap4 = true
			_playeralive()
			countdown()
		elif Modifier.map5 == true:
			Modifier.currentmap = "map5"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay5.tscn")
			Modifier.map5 = false
			Modifier.gameplaying = true
			Modifier.resmap5 = true
			_playeralive()
			countdown()
		elif Modifier.map6 == true:
			Modifier.currentmap = "map6"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay6.tscn")
			Modifier.map6 = false
			Modifier.gameplaying = true
			Modifier.resmap6 = true
			_playeralive()
			countdown()
		elif Modifier.map7 == true:
			Modifier.currentmap = "map7"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay7.tscn")
			Modifier.map7 = false
			Modifier.gameplaying = true
			Modifier.resmap7 = true
			_playeralive()
			countdown()
		elif Modifier.map8 == true:
			Modifier.currentmap = "map8"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay8.tscn")
			Modifier.map8 = false
			Modifier.gameplaying = true
			Modifier.resmap8 = true
			_playeralive()
			countdown()
