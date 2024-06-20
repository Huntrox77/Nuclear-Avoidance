extends Node
# Modifiers
var Blackout = false
var Smashbros = false
var Ice = false
var Crumble = false
var Impaction = false
var Sweeper = false

# Global Stuff
var gameplaying = false
var p1aircontrol = 0.09
var p2aircontrol = 0.09
var p3aircontrol = 0.09
var p4aircontrol = 0.09
var p1selection = true
var p2selection = true
var p3selection = false
var p4selection = false
var map1 = true
var map2 = false
var map3 = false
var Nuke2 = false
var Nuke3 = false
var Nuke4 = false
var playersleft = 2
var currentmap = "map1"

#list of players
var listofplayers = [p1selection, p2selection, p3selection, p4selection]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if gameplaying == true:
		if playersleft == 0:
			if map2 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
				map2 = false
				currentmap = "map2"
				for i in listofplayers:
					if i == true:
						playersleft += 1
			if map3 == true:
				get_tree().change_scene_to_file("res://Scenes/Game Scenes/gameplay2.tscn")
				map3 = false
				for i in listofplayers:
					if i == true:
						playersleft += 1
	
	#Code to pause the game by sending them back to the title screen.
	if Input.is_action_pressed("Pause"):
		gameplaying = false
		get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")
		map1 = true
		Blackout = false
		Smashbros = false
		Ice = false
		Crumble = false
		Impaction = false
		Sweeper = false
		p1aircontrol = 0.09
		p2aircontrol = 0.09
		p3aircontrol = 0.09
		p4aircontrol = 0.09
		p1selection = true
		p2selection = true
		p3selection = false
		p4selection = false
		map1 = true
		map2 = false
		map3 = false
		Nuke2 = false
		Nuke3 = false
		Nuke4 = false
		playersleft = 2
		currentmap = "map1"
