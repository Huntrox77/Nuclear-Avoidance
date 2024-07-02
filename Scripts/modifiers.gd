extends Node
# Modifiers
var Blackout = false
var Fog = false
var Smashbros = false
var Ice = false
var Crumble = false
var Impaction = false
var Sweeper = false

# Global Stuff
var gameplaying = false
var map1 = true
var p1aircontrol = 0.09
var p2aircontrol = 0.09
var p3aircontrol = 0.09
var p4aircontrol = 0.09
var p1selection = true
var p2selection = true
var p3selection = false
var p4selection = false
var map2 = false
var map3 = false
var map4 = false
var map5 = false
var Nuke2 = false
var Nuke3 = false
var Nuke4 = false
var playersleft = 2
var currentmap = "map1"

func _resetnukes():
	Nuke2 = false
	Nuke3 = false
	Nuke4 = false

func _reset():
	gameplaying = false
	map1 = true
	p1aircontrol = 0.09
	p2aircontrol = 0.09
	p3aircontrol = 0.09
	p4aircontrol = 0.09
	p1selection = true
	p2selection = true
	p3selection = false
	p4selection = false
	map2 = false
	map3 = false
	map4 = false
	map5 = false
	_resetnukes()
	playersleft = 2
	currentmap = "map1"

#Silly Stuff
var DOG = false
var Yharon = false
var Clam = false
var DOGMUSIC = false
var DOGMUSIC2 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#list of players
	var listofplayers = [p1selection, p2selection, p3selection, p4selection]
	if Clam == true:
		Yharon = true
	if gameplaying == true:
		if playersleft == 0:
			_resetnukes()
			if map2 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
				map2 = false
				currentmap = "map2"
				for i in listofplayers:
					if i == true:
						playersleft += 1
			elif map3 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay3.tscn")
				map3 = false
				currentmap = "map3"
				for i in listofplayers:
					if i == true:
						playersleft += 1
			elif map4 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay4.tscn")
				map4 = false
				currentmap = "map4"
				for i in listofplayers:
					if i == true:
						playersleft += 1
			elif map5 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay5.tscn")
				map5 = false
				currentmap = "map5"
				for i in listofplayers:
					if i == true:
						playersleft += 1
	
	#Code to pause the game by sending them back to the title screen.
	if Input.is_action_pressed("Pause"):
		_reset()
		get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
