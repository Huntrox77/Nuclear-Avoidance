extends Button
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


# Sets players to being alive if they should be 
func _player_alive():
	if Modifier.list_of_players[0] == true:
		Modifier.P1_Alive = true
	if Modifier.list_of_players[1] == true:
		Modifier.P2_Alive = true
	if Modifier.list_of_players[2] == true:
		Modifier.P3_Alive = true
	if Modifier.list_of_players[3] == true:
		Modifier.P4_Alive = true
	if Modifier.list_of_players[4] == true:
		Modifier.P5_Alive = true


func countdown():
	Modifier.Countdown_Finished = false
	Modifier.Start_Countdown = true


	# Code to change the scene to the different maps and reset points and other stuff.
func _on_pressed():
	Modifier._reset_nukes()
	if Modifier.players_left == 0:
		pass
	else:
		Modifier.P1_Points = 0
		Modifier.P2_Points = 0
		Modifier.P3_Points = 0
		Modifier.P4_Points = 0
		Modifier.P5_Points = 0
		if Modifier.map1 == true:
			Modifier.current_map = "map1"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay1.tscn")
			Modifier.map1 = false
			Modifier.game_playing = true
			Modifier.res_map1 = true
			_player_alive()
			countdown()
		elif Modifier.map2 == true:
			Modifier.current_map = "map2"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
			Modifier.map2 = false
			Modifier.game_playing = true
			Modifier.res_map2 = true
			_player_alive()
			countdown()
		elif Modifier.map3 == true:
			Modifier.current_map = "map3"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay3.tscn")
			Modifier.map3 = false
			Modifier.game_playing = true
			Modifier.res_map3 = true
			_player_alive()
			countdown()
		elif Modifier.map4 == true:
			Modifier.current_map = "map4"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay4.tscn")
			Modifier.map4 = false
			Modifier.game_playing = true
			Modifier.res_map4 = true
			_player_alive()
			countdown()
		elif Modifier.map5 == true:
			Modifier.current_map = "map5"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay5.tscn")
			Modifier.map5 = false
			Modifier.game_playing = true
			Modifier.res_map5 = true
			_player_alive()
			countdown()
		elif Modifier.map6 == true:
			Modifier.current_map = "map6"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay6.tscn")
			Modifier.map6 = false
			Modifier.game_playing = true
			Modifier.res_map6 = true
			_player_alive()
			countdown()
		elif Modifier.map7 == true:
			Modifier.current_map = "map7"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay7.tscn")
			Modifier.map7 = false
			Modifier.game_playing = true
			Modifier.res_map7 = true
			_player_alive()
			countdown()
		elif Modifier.map8 == true:
			Modifier.current_map = "map8"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay8.tscn")
			Modifier.map8 = false
			Modifier.game_playing = true
			Modifier.res_map8 = true
			_player_alive()
			countdown()
		elif Modifier.map9 == true:
			Modifier.current_map = "map9"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay9.tscn")
			Modifier.map9 = false
			Modifier.game_playing = true
			Modifier.res_map9 = true
			_player_alive()
			countdown()
		elif Modifier.map10 == true:
			Modifier.current_map = "map10"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay10.tscn")
			Modifier.map10 = false
			Modifier.game_playing = true
			Modifier.res_map10 = true
			_player_alive()
			countdown()
		elif Modifier.map11 == true:
			Modifier.current_map = "map11"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay11.tscn")
			Modifier.map11 = false
			Modifier.game_playing = true
			Modifier.res_map11 = true
			_player_alive()
			countdown()
		elif Modifier.map12 == true:
			Modifier.current_map = "map12"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay12.tscn")
			Modifier.map12 = false
			Modifier.game_playing = true
			Modifier.res_map12 = true
			_player_alive()
			countdown()
		elif Modifier.map13 == true:
			Modifier.current_map = "map13"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay13.tscn")
			Modifier.map13 = false
			Modifier.game_playing = true
			Modifier.res_map13 = true
			_player_alive()
			countdown()
		elif Modifier.map14 == true:
			Modifier.current_map = "map14"
			get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay14.tscn")
			Modifier.map14 = false
			Modifier.game_playing = true
			Modifier.res_map14 = true
			_player_alive()
			countdown()
