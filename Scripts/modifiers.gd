extends Node
@onready var Config = get_node("/root/ConfigScript")

# Players & Lamps
var Player_One = null
var Player_Two = null
var Player_Three = null
var Player_Four = null
var Player_Five = null
var Lamp_One = null
var Lamp_Two = null

# Modifiers
var list_of_players = []
var spawns_used = []
var Blackout = false
var Fog = false
var Smash_bros = false
var Ice = false
var Crumble = false
var Impaction = false
var Sweeper = false
var Power = false
var Collide = false
var Follow = false
var Reverse = false
var DMNSC = 4
var Gravity_Mult = 100
var P_Speed = 100

# Global Stuff
var p1_color = Color(1, 1, 1)
var p2_color = Color(1, 1, 0)
var p3_color = Color(0.627, 0, 0.718)
var p4_color = Color(0.741, 0, 0.31)
var pause = false
var Start_Countdown = false
var Countdown_Finished = false
var reset = false
var p1_air_control = 0.09
var p2_air_control = 0.09
var p3_air_control = 0.09
var p4_air_control = 0.09
var p1_selection = true
var p2_selection = true
var p3_selection = false
var p4_selection = false
var p5_selection = false
var player_X = [0.0, 0.0, 0.0, 0.0, 0.0]
var game_playing = false
var Challenge_Or_Local = "local"
var loop = false
var map1 = true
var map2 = false
var map3 = false
var map4 = false
var map5 = false
var map6 = false
var map7 = false
var map8 = false
var map9 = false
var map10 = false
var map11 = false
var map12 = false
var map13 = false
var map14 = false
var res_map1 = false
var res_map2 = false
var res_map3 = false
var res_map4 = false
var res_map5 = false
var res_map6 = false
var res_map7 = false
var res_map8 = false
var res_map9 = false
var res_map10 = false
var res_map11 = false
var res_map12 = false
var res_map13 = false
var res_map14 = false
var Nuke2 = false
var Nuke3 = false
var Nuke4 = false
var power_min_time = 10
var power_max_time = 25
var players_left = 2
var How_Many_players_left = 1
var How_Many_Players_Left_Choice = 1
var UI_Size = 0
var Window_Mode = 0
var P1_Alive = false
var P2_Alive = false
var P3_Alive = false
var P4_Alive = false
var P5_Alive = false
var P1_Points = 0
var P2_Points = 0
var P3_Points = 0
var P4_Points = 0
var P5_Points = 0
var current_map = "menu"
var current_map_no = 1
var Challenge_No = 1
var In_Timer = 0

func _reset_nukes():
	Nuke2 = false
	Nuke3 = false
	Nuke4 = false

func _reset_maps():
	map1 = res_map1
	map2 = res_map2
	map3 = res_map3
	map4 = res_map4
	map5 = res_map5
	map6 = res_map6
	map7 = res_map7
	map8 = res_map8
	map9 = res_map9
	map10 = res_map10
	map11 = res_map11
	map12 = res_map12
	map13 = res_map13
	map14 = res_map14
	res_map1 = false
	res_map2 = false
	res_map3 = false
	res_map4 = false
	res_map5 = false
	res_map6 = false
	res_map7 = false
	res_map8 = false
	res_map9 = false
	res_map10 = false
	res_map11 = false
	res_map12 = false
	res_map13 = false
	res_map14 = false
	current_map = "menu"

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _reset():
	game_playing = false
	p1_air_control = 0.09
	p2_air_control = 0.09
	p3_air_control = 0.09
	p4_air_control = 0.09
	for i in list_of_players:
		if i == true:
			players_left += 1
	_reset_maps()
	_reset_nukes()
	P1_Points = 0
	P2_Points = 0
	P3_Points = 0
	P4_Points = 0
	P5_Points = 0

func _resetmods():
	game_playing = false
	p1_air_control = 0.09
	p2_air_control = 0.09
	p3_air_control = 0.09
	p4_air_control = 0.09
	p1_selection = true
	p2_selection = true
	p3_selection = false
	p4_selection = false
	p5_selection = false
	players_left = 2
	reset = false
	Blackout = false
	Fog = false
	Smash_bros = false
	Ice = false
	Crumble = false
	Impaction = false
	Sweeper = false
	Power = false
	Collide = false
	Follow = false
	Reverse = false
	DMNSC = 4
	Gravity_Mult = 100
	_reset_nukes()
	
#Silly Stuff
var Yharon = false
var Clam = false
var DOG_MUSIC = false
var DOG_MUSIC2 = false


func _reset_players():
	players_left = 0
	spawns_used = []
	for i in list_of_players:
			if i == true:
				players_left += 1
	if list_of_players[0] == true:
		P1_Alive = true
	if list_of_players[1] == true:
		P2_Alive = true
	if list_of_players[2] == true:
		P3_Alive = true
	if list_of_players[3] == true:
		P4_Alive = true
	if list_of_players[4] == true:
		P5_Alive = true

func _award_Points():
	if list_of_players[0] == true:
		if P1_Alive == true:
			P1_Points += 1
	if list_of_players[1] == true:
		if P2_Alive == true:
			P2_Points += 1
	if list_of_players[2] == true:
		if P3_Alive == true:
			P3_Points += 1
	if list_of_players[3] == true:
		if P4_Alive == true:
			P4_Points += 1
	if list_of_players[4] == true:
		if P5_Alive == true:
			P5_Points += 1


func countdown():
	Countdown_Finished = false
	Start_Countdown = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# If in main menu, you cant pause
	if current_map == "menu":
		pause = false
	# Makes it so if you are not doing challenges, we need to know how many players are dead before going to the next scene
	if Challenge_Or_Local == "local":
		How_Many_players_left = How_Many_Players_Left_Choice
	else:
		How_Many_players_left = 0
	if reset == true:
		_resetmods()
	# Global gravity Changer
	ProjectSettings.set_setting("physics/2d/default_gravity", Gravity_Mult * 9.8)
	# list of selected players
	list_of_players = [p1_selection, p2_selection, p3_selection, p4_selection, p5_selection]
	# secret calamity mode!
	if Clam == true:
		Yharon = true
	# this is the big main script that changes maps / scenes, gives players points and really just lets the game be played lol.
	if game_playing == true:
		if players_left <= How_Many_players_left:
			_award_Points()
			_reset_nukes()
			if Challenge_Or_Local == "local":
				if map2 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
					current_map = "map2"
					map2 = false
					res_map2 = true
					_reset_players()
					countdown()
				elif map3 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay3.tscn")
					current_map = "map3"
					map3 = false
					res_map3 = true
					_reset_players()
					countdown()
				elif map4 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay4.tscn")
					current_map = "map4"
					map4 = false
					res_map4 = true
					_reset_players()
					countdown()
				elif map5 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay5.tscn")
					current_map = "map5"
					map5 = false
					res_map5 = true
					_reset_players()
					countdown()
				elif map6 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay6.tscn")
					current_map = "map6"
					map6 = false
					res_map6 = true
					_reset_players()
					countdown()
				elif map7 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay7.tscn")
					current_map = "map7"
					map7 = false
					res_map7 = true
					_reset_players()
					countdown()
				elif map8 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay8.tscn")
					current_map = "map8"
					map8 = false
					res_map8 = true
					_reset_players()
					countdown()
				elif map9 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay9.tscn")
					current_map = "map9"
					map9 = false
					res_map9 = true
					_reset_players()
					countdown()
				elif map10 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay10.tscn")
					current_map = "map10"
					map10 = false
					res_map10 = true
					_reset_players()
					countdown()
				elif map11 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay11.tscn")
					current_map = "map11"
					map11 = false
					res_map11 = true
					_reset_players()
					countdown()
				elif map12 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay12.tscn")
					current_map = "map12"
					map12 = false
					res_map12 = true
					_reset_players()
					countdown()
				elif map13 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay13.tscn")
					current_map = "map13"
					map13 = false
					res_map13 = true
					_reset_players()
					countdown()
				elif map14 == true:
					get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay14.tscn")
					current_map = "map14"
					map14 = false
					res_map14 = true
					_reset_players()
					countdown()
				# Loop maps again if enabled
				elif loop == true:
						_reset_maps()
				else:
					# if local go to winscreen, else go to challenge select screen
					if Challenge_Or_Local == "local":
						get_tree().change_scene_to_file("res://Scenes/Game Scenes/win_screen.tscn")
						_reset_players()
						current_map = "winscreen"
					elif Challenge_Or_Local == "Challenge":
						get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
						_reset_players()
						current_map = "menu"
			elif Challenge_Or_Local == "Challenge":
						get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
						_reset_players()
						current_map = "menu"
	# Pauses the game
	if Input.is_action_just_pressed("Pause"):
		if game_playing == true:
			pause = not pause
			get_tree().paused = pause
	if Input.is_action_just_pressed("DevSkip"):
		if game_playing == true:
			players_left = How_Many_Players_Left_Choice
