extends Node
# Modifiers
var listofplayers = []
var Blackout = false
var Fog = false
var Smashbros = false
var Ice = false
var Crumble = false
var Impaction = false
var Sweeper = false
var Power = false
var Collide = false
var DMNSC = 4
var GravityMult = 100

# Global Stuff
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
var gameplaying = false
var ChallengeOrLocal = "local"
var loop = true
var map1 = true
var map2 = false
var map3 = false
var map4 = false
var map5 = false
var map6 = false
var resmap1 = false
var resmap2 = false
var resmap3 = false
var resmap4 = false
var resmap5 = false
var resmap6 = false
var Nuke2 = false
var Nuke3 = false
var Nuke4 = false
var playersleft = 2
var currentmap = "menu"
var currentmapno = 1
var ChallengeNo = 1

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
	resmap1 = false
	resmap2 = false
	resmap3 = false
	resmap4 = false
	resmap5 = false
	resmap6 = false
	currentmap = "menu"

func _ready():
	pass # Replace with function body.

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if reset == true:
		_resetmods()
	ProjectSettings.set_setting("physics/2d/default_gravity", GravityMult * 9.8)
	listofplayers = [p1selection, p2selection, p3selection, p4selection, p5selection]
	if Clam == true:
		Yharon = true
	if gameplaying == true:
		if playersleft == 0:
			_resetnukes()
			if map2 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
				map2 = false
				resmap2 = true
				for i in listofplayers:
					if i == true:
						playersleft += 1
			elif map3 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay3.tscn")
				map3 = false
				resmap3 = true
				for i in listofplayers:
					if i == true:
						playersleft += 1
			elif map4 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay4.tscn")
				map4 = false
				resmap4 = true
				for i in listofplayers:
					if i == true:
						playersleft += 1
			elif map5 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay5.tscn")
				map5 = false
				resmap5 = true
				for i in listofplayers:
					if i == true:
						playersleft += 1
			elif map6 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay6.tscn")
				map6 = false
				resmap6 = true
				for i in listofplayers:
					if i == true:
						playersleft += 1
			elif loop == true:
					_resetmaps()
			else:
				_reset()
				if ChallengeOrLocal == "local":
					get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
				elif ChallengeOrLocal == "Challenge":
					get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
	#Code to pause the game by sending them back to the title screen.
	if Input.is_action_pressed("Pause"):
		if gameplaying == true:
			listofplayers = 0
			_reset()
			if ChallengeOrLocal == "local":
				get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
			elif ChallengeOrLocal == "Challenge":
				get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
