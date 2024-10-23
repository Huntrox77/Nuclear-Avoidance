extends Node2D
@onready var Modifier = get_node("/root/Modifiers")
var rand_move_speed = randf_range(0.33, 4.33)
var rand_move_speed_Y = randf_range(-4.33, 4.33)
var upsidedown_bomb = false
var random_spawn_but_like_more = randi_range(1,3)
var move_x = 0
var neg_spawn_radius = -234
var spawn_radius = 234
var neg_spawn_radius2 = -234
var spawn_radius2 = 234
var neg_spawn_radius3 = -234
var spawn_radius3 = 234

# Called when the node enters the scene tree for the first time.
func _ready():
	# If the map has grav flipping, make it so bombs can spawn upsidedown and look alright
	if Modifier.current_map == "map7" or Modifier.current_map == "map8":
		if rand_move_speed_Y <= 0:
			position.y = 32
			rotation = 135
	random_spawn_but_like_more = randi_range(1,3)
	
	# Changes spawn radius for all maps
	if Modifier.current_map == "map1":
		neg_spawn_radius = -230
		spawn_radius = 235
		neg_spawn_radius2 = -230
		spawn_radius2 = 235
		neg_spawn_radius3 = -230
		spawn_radius3 = 235
	if Modifier.current_map == "map2":
		neg_spawn_radius = -490
		spawn_radius = -340
		neg_spawn_radius2 = -45
		spawn_radius2 = 45
		neg_spawn_radius3 = -340
		spawn_radius3 = 490
	if Modifier.current_map == "map3":
		neg_spawn_radius = -490
		spawn_radius = -340
		neg_spawn_radius2 = -300
		spawn_radius2 = 300
		neg_spawn_radius3 = 340
		spawn_radius3 = 490
	if Modifier.current_map == "map4":
		neg_spawn_radius = -490
		spawn_radius = -340
		neg_spawn_radius2 = -45
		spawn_radius2 = 45
		neg_spawn_radius3 = -340
		spawn_radius3 = 490
	if Modifier.current_map == "map5":
		neg_spawn_radius = -540
		spawn_radius = -280
		neg_spawn_radius2 = -60
		spawn_radius2 = 60
		neg_spawn_radius3 = 280
		spawn_radius3 = 540
	if Modifier.current_map == "map6":
		neg_spawn_radius = -490
		spawn_radius = -340
		neg_spawn_radius2 = -45
		spawn_radius2 = 45
		neg_spawn_radius3 = -340
		spawn_radius3 = 490
	if Modifier.current_map == "map7":
		neg_spawn_radius = -96
		spawn_radius = -96
		neg_spawn_radius2 = 0
		spawn_radius2 = 0
		neg_spawn_radius3 = 96
		spawn_radius3 = 96
	if Modifier.current_map == "map8":
		neg_spawn_radius = -500
		spawn_radius = -372
		neg_spawn_radius2 = -64
		spawn_radius2 = 64
		neg_spawn_radius3 = 500
		spawn_radius3 = -372
	if Modifier.current_map == "map9":
		neg_spawn_radius = -500
		spawn_radius = -372
		neg_spawn_radius2 = -64
		spawn_radius2 = 64
		neg_spawn_radius3 = 500
		spawn_radius3 = -372
	if Modifier.current_map == "map10":
		neg_spawn_radius = -500
		spawn_radius = -372
		neg_spawn_radius2 = -64
		spawn_radius2 = 64
		neg_spawn_radius3 = 500
		spawn_radius3 = -372
	if Modifier.current_map == "map11":
		neg_spawn_radius = -500
		spawn_radius = -372
		neg_spawn_radius2 = -64
		spawn_radius2 = 64
		neg_spawn_radius3 = 500
		spawn_radius3 = -372
	if Modifier.current_map == "map12":
		neg_spawn_radius = -500
		spawn_radius = -372
		neg_spawn_radius2 = -64
		spawn_radius2 = 64
		neg_spawn_radius3 = 500
		spawn_radius3 = -372
	if Modifier.current_map == "map13":
		neg_spawn_radius = -500
		spawn_radius = -372
		neg_spawn_radius2 = -64
		spawn_radius2 = 64
		neg_spawn_radius3 = 500
		spawn_radius3 = -372
	if Modifier.current_map == "menu":
		neg_spawn_radius = -100
		spawn_radius = 500
		neg_spawn_radius2 = -100
		spawn_radius2 = 500
		neg_spawn_radius3 = -100
		spawn_radius3 = 500
		
	# Randomize the spawn within the chosen combines from above ^
	if random_spawn_but_like_more == 1:
		position.x = randi_range(neg_spawn_radius, spawn_radius)
	elif random_spawn_but_like_more == 2:
		position.x = randi_range(neg_spawn_radius2, spawn_radius2)
	elif random_spawn_but_like_more == 3:
		position.x = randi_range(neg_spawn_radius3, spawn_radius3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Use the normal falling code and reverse it on flip grav maps.
	if Modifier.current_map != "map7" and Modifier.current_map != "map8":
		if move_x == -1:
			position -= Vector2(-rand_move_speed * 0.5, -rand_move_speed) #Positive Diagonal Movement
		elif move_x == 1:
			position -= Vector2(rand_move_speed * 0.5, -rand_move_speed) #Diagonal Movement
		elif move_x == 0:
			position += Vector2(0, rand_move_speed) #Movement
	else:
		if move_x == -1:
			position += Vector2(rand_move_speed * 0.5, rand_move_speed_Y) #Positive Diagonal Movement
		elif move_x == 1:
			position += Vector2(-rand_move_speed * 0.5, rand_move_speed_Y) #Diagonal Movement
		elif move_x == 0:
			position += Vector2(0, rand_move_speed_Y) #Movement

# Does Shield Stuff by adding shield meta to player
func _on_shield_body_entered(body):
	if body.has_meta("PlayerOnly"):
		if body.get_meta("PlayerOnly") == true:
			if randi_range(1,2) == 1:
				rand_move_speed = 0
				rand_move_speed_Y = 0
			else:
				pass
	else:
		rand_move_speed = 0
		rand_move_speed_Y = 0
		if body.has_meta("Player"):
			body.set_meta("Shield", true)
			queue_free()


# Does Spring Stuff by adding shield meta to player
func _on_sweeper_body_entered(body):
	if body.has_meta("PlayerOnly"):
		if body.get_meta("PlayerOnly") == true:
			if randi_range(1,2) == 1:
				rand_move_speed = 0
				rand_move_speed_Y = 0
			else:
				pass
	else:
		rand_move_speed = 0
		rand_move_speed_Y = 0
		if body.has_meta("Player"):
			body.set_meta("Spring", true)
			queue_free()
