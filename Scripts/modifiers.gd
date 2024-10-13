extends Node
@onready var Config = get_node("/root/ConfigScript")

# Players
var PlayerOne = null
var PlayerTwo = null
var PlayerThree = null
var PlayerFour = null
var PlayerFive = null

# Modifiers
var listofplayers = []
var spawnsused = []
var Blackout = false
var Fog = false
var Smashbros = false
var Ice = false
var Crumble = false
var Impaction = false
var Sweeper = false
var Power = false
var Collide = false
var Follow = false
var DMNSC = 4
var GravityMult = 100
var PSpeed = 100

# Global Stuff
var pause = false
var StartCountdown = false
var CountdownFinished = false
var reset = false
var p1aircontrol = 0.09
var p2aircontrol = 0.09
var p3aircontrol = 0.09
var p4aircontrol = 0.09
var p1selection = true
var p2selection = true
var p3selection = false
var p4selection = false
var p5selection = false
var playerX = [0.0, 0.0, 0.0, 0.0, 0.0]
var gameplaying = false
var ChallengeOrLocal = "local"
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
var resmap1 = false
var resmap2 = false
var resmap3 = false
var resmap4 = false
var resmap5 = false
var resmap6 = false
var resmap7 = false
var resmap8 = false
var resmap9 = false
var resmap10 = false
var resmap11 = false
var resmap12 = false
var resmap13 = false
var Nuke2 = false
var Nuke3 = false
var Nuke4 = false
var powermintime = 10
var powermaxtime = 25
var playersleft = 2
var HowManyPlayersLeft = 1
var HowManyPlayersLeftChoice = 1
var UISize = 0
var P1Alive = false
var P2Alive = false
var P3Alive = false
var P4Alive = false
var P5Alive = false
var P1Points = 0
var P2Points = 0
var P3Points = 0
var P4Points = 0
var P5Points = 0
var currentmap = "menu"
var currentmapno = 1
var ChallengeNo = 1
var InTimer = 0

func _resetnukes():
	Nuke2 = false
	Nuke3 = false
	Nuke4 = false

func _resetmaps():
	map1 = resmap1
	map2 = resmap2
	map3 = resmap3
	map4 = resmap4
	map5 = resmap5
	map6 = resmap6
	map7 = resmap7
	map8 = resmap8
	map9 = resmap9
	map10 = resmap10
	map11 = resmap11
	map12 = resmap12
	map13 = resmap13
	resmap1 = false
	resmap2 = false
	resmap3 = false
	resmap4 = false
	resmap5 = false
	resmap6 = false
	resmap7 = false
	resmap8 = false
	resmap9 = false
	resmap10 = false
	resmap11 = false
	resmap12 = false
	resmap13 = false
	currentmap = "menu"

func _ready():
	pass

func _reset():
	gameplaying = false
	p1aircontrol = 0.09
	p2aircontrol = 0.09
	p3aircontrol = 0.09
	p4aircontrol = 0.09
	for i in listofplayers:
		if i == true:
			playersleft += 1
	_resetmaps()
	_resetnukes()
	P1Points = 0
	P2Points = 0
	P3Points = 0
	P4Points = 0
	P5Points = 0

func _resetmods():
	gameplaying = false
	p1aircontrol = 0.09
	p2aircontrol = 0.09
	p3aircontrol = 0.09
	p4aircontrol = 0.09
	p1selection = true
	p2selection = true
	p3selection = false
	p4selection = false
	p5selection = false
	playersleft = 2
	reset = false
	Blackout = false
	Fog = false
	Smashbros = false
	Ice = false
	Crumble = false
	Impaction = false
	Sweeper = false
	Power = false
	Collide = false
	DMNSC = 4
	GravityMult = 100
	_resetnukes()
	
#Silly Stuff
var Yharon = false
var Clam = false
var DOGMUSIC = false
var DOGMUSIC2 = false


func _resetplayers():
	playersleft = 0
	spawnsused = []
	for i in listofplayers:
			if i == true:
				playersleft += 1
	if listofplayers[0] == true:
		P1Alive = true
	if listofplayers[1] == true:
		P2Alive = true
	if listofplayers[2] == true:
		P3Alive = true
	if listofplayers[3] == true:
		P4Alive = true
	if listofplayers[4] == true:
		P5Alive = true

func _awardpoints():
	if listofplayers[0] == true:
		if P1Alive == true:
			P1Points += 1
	if listofplayers[1] == true:
		if P2Alive == true:
			P2Points += 1
	if listofplayers[2] == true:
		if P3Alive == true:
			P3Points += 1
	if listofplayers[3] == true:
		if P4Alive == true:
			P4Points += 1
	if listofplayers[4] == true:
		if P5Alive == true:
			P5Points += 1


func countdown():
	CountdownFinished = false
	StartCountdown = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if currentmap == "menu":
		pause = false
	if ChallengeOrLocal == "local":
		HowManyPlayersLeft = HowManyPlayersLeftChoice
	else:
		HowManyPlayersLeft = 0
	if reset == true:
		_resetmods()
	ProjectSettings.set_setting("physics/2d/default_gravity", GravityMult * 9.8)
	listofplayers = [p1selection, p2selection, p3selection, p4selection, p5selection]
	if Clam == true:
		Yharon = true
	if gameplaying == true:
		if playersleft <= HowManyPlayersLeft:
			_awardpoints()
			_resetnukes()
			if map2 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
				currentmap = "map2"
				map2 = false
				resmap2 = true
				_resetplayers()
				countdown()
			elif map3 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay3.tscn")
				currentmap = "map3"
				map3 = false
				resmap3 = true
				_resetplayers()
				countdown()
			elif map4 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay4.tscn")
				currentmap = "map4"
				map4 = false
				resmap4 = true
				_resetplayers()
				countdown()
			elif map5 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay5.tscn")
				currentmap = "map5"
				map5 = false
				resmap5 = true
				_resetplayers()
				countdown()
			elif map6 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay6.tscn")
				currentmap = "map6"
				map6 = false
				resmap6 = true
				_resetplayers()
				countdown()
			elif map7 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay7.tscn")
				currentmap = "map7"
				map7 = false
				resmap7 = true
				_resetplayers()
				countdown()
			elif map8 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay8.tscn")
				currentmap = "map8"
				map8 = false
				resmap8 = true
				_resetplayers()
				countdown()
			elif map9 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay9.tscn")
				currentmap = "map9"
				map9 = false
				resmap9 = true
				_resetplayers()
				countdown()
			elif map10 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay10.tscn")
				currentmap = "map10"
				map10 = false
				resmap10 = true
				_resetplayers()
				countdown()
			elif map11 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay11.tscn")
				currentmap = "map11"
				map11 = false
				resmap11 = true
				_resetplayers()
				countdown()
			elif map12 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay12.tscn")
				currentmap = "map12"
				map12 = false
				resmap12 = true
				_resetplayers()
				countdown()
			elif map13 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay13.tscn")
				currentmap = "map13"
				map13 = false
				resmap13 = true
				_resetplayers()
				countdown()
			elif loop == true:
					_resetmaps()
			else:
				playersleft = 0
				_reset()
				if ChallengeOrLocal == "local":
					get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
				elif ChallengeOrLocal == "Challenge":
					get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
	if Input.is_action_just_pressed("Pause"):
		pause = not pause
