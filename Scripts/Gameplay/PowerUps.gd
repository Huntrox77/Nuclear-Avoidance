extends Node2D
@onready var Modifier = get_node("/root/Modifiers")
var randmovespeed = randf_range(0.33, 4.33)
var randmovespeedY = randf_range(-4.33, 4.33)
var upsidedownbomb = false
var randomspawnbutlikemore = randi_range(1,3)
var movex = 0
var negspawnradius = -234
var spawnradius = 234
var negspawnradius2 = -234
var spawnradius2 = 234
var negspawnradius3 = -234
var spawnradius3 = 234

# Called when the node enters the scene tree for the first time.
func _ready():
	if Modifier.currentmap == "map7" or Modifier.currentmap == "map8":
		if randmovespeedY <= 0:
			position.y = 32
			rotation = 135
	randomspawnbutlikemore = randi_range(1,3)
	# Changes spawn radius for map 2
	if Modifier.currentmap == "map1":
		negspawnradius = -230
		spawnradius = 235
		negspawnradius2 = -230
		spawnradius2 = 235
		negspawnradius3 = -230
		spawnradius3 = 235
	if Modifier.currentmap == "map2":
		negspawnradius = -490
		spawnradius = -340
		negspawnradius2 = -45
		spawnradius2 = 45
		negspawnradius3 = -340
		spawnradius3 = 490
	if Modifier.currentmap == "map3":
		negspawnradius = -490
		spawnradius = -340
		negspawnradius2 = -300
		spawnradius2 = 300
		negspawnradius3 = 340
		spawnradius3 = 490
	if Modifier.currentmap == "map4":
		negspawnradius = -490
		spawnradius = -340
		negspawnradius2 = -45
		spawnradius2 = 45
		negspawnradius3 = -340
		spawnradius3 = 490
	if Modifier.currentmap == "map5":
		negspawnradius = -540
		spawnradius = -280
		negspawnradius2 = -60
		spawnradius2 = 60
		negspawnradius3 = 280
		spawnradius3 = 540
	if Modifier.currentmap == "map6":
		negspawnradius = -490
		spawnradius = -340
		negspawnradius2 = -45
		spawnradius2 = 45
		negspawnradius3 = -340
		spawnradius3 = 490
	if Modifier.currentmap == "map7":
		negspawnradius = -96
		spawnradius = -96
		negspawnradius2 = 0
		spawnradius2 = 0
		negspawnradius3 = 96
		spawnradius3 = 96
	if Modifier.currentmap == "map8":
		negspawnradius = -500
		spawnradius = -372
		negspawnradius2 = -64
		spawnradius2 = 64
		negspawnradius3 = 500
		spawnradius3 = -372
	if Modifier.currentmap == "menu":
		negspawnradius = -100
		spawnradius = 500
		negspawnradius2 = -100
		spawnradius2 = 500
		negspawnradius3 = -100
		spawnradius3 = 500
		
	if randomspawnbutlikemore == 1:
		position.x = randi_range(negspawnradius, spawnradius)
	elif randomspawnbutlikemore == 2:
		position.x = randi_range(negspawnradius2, spawnradius2)
	elif randomspawnbutlikemore == 3:
		position.x = randi_range(negspawnradius3, spawnradius3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.currentmap != "map7" and Modifier.currentmap != "map8":
		if movex == -1:
			position -= Vector2(-randmovespeed * 0.5, -randmovespeed) #Positive Diagonal Movement
		elif movex == 1:
			position -= Vector2(randmovespeed * 0.5, -randmovespeed) #Diagonal Movement
		elif movex == 0:
			position += Vector2(0, randmovespeed) #Movement
	else:
		if movex == -1:
			position += Vector2(randmovespeed * 0.5, randmovespeedY) #Positive Diagonal Movement
		elif movex == 1:
			position += Vector2(-randmovespeed * 0.5, randmovespeedY) #Diagonal Movement
		elif movex == 0:
			position += Vector2(0, randmovespeedY) #Movement

# Does Shield Shit
func _on_shield_body_entered(body):
	if body.has_meta("PlayerOnly"):
		if body.get_meta("PlayerOnly") == true:
			if randi_range(1,2) == 1:
				randmovespeed = 0
				randmovespeedY = 0
			else:
				pass
	else:
		randmovespeed = 0
		randmovespeedY = 0
		if body.has_meta("Player"):
			body.set_meta("Shield", true)
			queue_free()


func _on_sweeper_body_entered(body):
	if body.has_meta("PlayerOnly"):
		if body.get_meta("PlayerOnly") == true:
			if randi_range(1,2) == 1:
				randmovespeed = 0
				randmovespeedY = 0
			else:
				pass
	else:
		randmovespeed = 0
		randmovespeedY = 0
		if body.has_meta("Player"):
			body.set_meta("Spring", true)
			queue_free()
