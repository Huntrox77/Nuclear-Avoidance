extends Node2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var timer = $Explodimer
@onready var raidus = $BlastRadius/CollisionShape2D
@onready var Explosive_Point = $BlastRadius/Explosive_Point
@onready var Explosive_Anim = $Explosion
@onready var Nuke = $Nuke
@onready var Yharon = $Yharon
@export var Explosion:PackedScene

var rand_move_speed = randf_range(0.33, 4.33)
var rand_move_speed_Y = randf_range(-4.33, 4.33)
var upsidedown_bomb = false
var random_spawn_but_like_more = randi_range(1,3)
var move = true
var splosion = false
var neg_spawn_radius = -234
var spawn_radius = 234
var neg_spawn_radius2 = -234
var spawn_radius2 = 234
var neg_spawn_radius3 = -234
var spawn_radius3 = 234
var exp_speed = 4200
var randi_Y = randi_range(1, 3)
var Randi_Player = randi_range(0, 4)
var move_x = 0
var move_x1 = 1
var move_x2 = 4
var Halfit = 50


func _ready():
	# Sets the bombs rock sprtie randomly
	var Random_Rock = randi_range(1,3)
	# If the map has grav flipping, make it so bombs can spawn upsidedown and look alright
	if Modifier.current_map == "map7" or Modifier.current_map == "map8" or Modifier.current_map == "map11":
		if rand_move_speed_Y <= 0:
			position.y = 32
			rotation = 135
	# An attempt at making you explode less when you are faster or slower because you would go flying origanally
	if Modifier.P_Speed >= 149:
		Halfit = 50
	elif Modifier.P_Speed <= 51:
		Halfit = 50
	else:
		Halfit = 100
	# Randomize the spawns again
	random_spawn_but_like_more = randi_range(1,3)
	# Minuses move_x2 by the DMNSC modifier
	move_x2 = 10 - Modifier.DMNSC
	# If clam mode on add yharon sprite instead
	if Modifier.Yharon == true:
		Yharon.show()
		Explosive_Anim.hide()
		Nuke.hide()
		$Rock1.hide()
		$Rock2.hide()
		$Rock3.hide()
	else:
		Yharon.hide()
		Explosive_Anim.hide()
	# If the nukes shouldn't exist yet, kill them.
	if self.name == "Nuke2":
		if Modifier.Nuke2 == false:
			self.queue_free()
	if self.name == "Nuke3":
		if Modifier.Nuke3 == false:
			self.queue_free()
	if self.name == "Nuke4":
		if Modifier.Nuke4 == false:
			self.queue_free()
			
	# Changes the spawn radius for all the maps
	if Modifier.current_map == "map1":
		$Rock.queue_free()
		neg_spawn_radius = -230
		spawn_radius = 235
		neg_spawn_radius2 = -230
		spawn_radius2 = 235
		neg_spawn_radius3 = -230
		spawn_radius3 = 235
	if Modifier.current_map == "map2":
		$Rock.queue_free()
		neg_spawn_radius = -490
		spawn_radius = -340
		neg_spawn_radius2 = -45
		spawn_radius2 = 45
		neg_spawn_radius3 = -340
		spawn_radius3 = 490
	if Modifier.current_map == "map3":
		$Rock.queue_free()
		neg_spawn_radius = -490
		spawn_radius = -340
		neg_spawn_radius2 = -300
		spawn_radius2 = 300
		neg_spawn_radius3 = 340
		spawn_radius3 = 490
	if Modifier.current_map == "map4":
		$Rock.queue_free()
		neg_spawn_radius = -490
		spawn_radius = -340
		neg_spawn_radius2 = -45
		spawn_radius2 = 45
		neg_spawn_radius3 = -340
		spawn_radius3 = 490
	if Modifier.current_map == "map5":
		$Rock.queue_free()
		neg_spawn_radius = -540
		spawn_radius = -280
		neg_spawn_radius2 = -60
		spawn_radius2 = 60
		neg_spawn_radius3 = 280
		spawn_radius3 = 540
	if Modifier.current_map == "map6":
		$Rock.queue_free()
		neg_spawn_radius = -490
		spawn_radius = -340
		neg_spawn_radius2 = -45
		spawn_radius2 = 45
		neg_spawn_radius3 = -340
		spawn_radius3 = 490
	if Modifier.current_map == "map7":
		$Rock.queue_free()
		neg_spawn_radius = -96
		spawn_radius = -96
		neg_spawn_radius2 = 0
		spawn_radius2 = 0
		neg_spawn_radius3 = 96
		spawn_radius3 = 96
	if Modifier.current_map == "map8":
		$Rock.queue_free()
		neg_spawn_radius = -500
		spawn_radius = -372
		neg_spawn_radius2 = -64
		spawn_radius2 = 64
		neg_spawn_radius3 = 500
		spawn_radius3 = -372
	if Modifier.current_map == "map9":
		$Bomb.queue_free()
		if Random_Rock == 1:
			$Rock1.show()
			$Nuke.hide()
		elif Random_Rock == 2:
			$Rock2.show()
			$Nuke.hide()
		elif Random_Rock == 3:
			$Rock3.show()
			$Nuke.hide()
		neg_spawn_radius = -501
		spawn_radius = -380
		neg_spawn_radius2 = -212
		spawn_radius2 = 152
		neg_spawn_radius3 = 397
		spawn_radius3 = 493
	if Modifier.current_map == "map10":
		$Bomb.queue_free()
		if Random_Rock == 1:
			$Rock1.show()
			$Nuke.hide()
		elif Random_Rock == 2:
			$Rock2.show()
			$Nuke.hide()
		elif Random_Rock == 3:
			$Rock3.show()
			$Nuke.hide()
		neg_spawn_radius = -481
		spawn_radius = -353
		neg_spawn_radius2 = -73
		spawn_radius2 = 47
		neg_spawn_radius3 = 328
		spawn_radius3 = 449
	if Modifier.current_map == "map11":
		$Rock.queue_free()
		neg_spawn_radius = -417
		spawn_radius = -289
		neg_spawn_radius2 = -64
		spawn_radius2 = 64
		neg_spawn_radius3 = 292
		spawn_radius3 = 420
	if Modifier.current_map == "map12":
		$Bomb.queue_free()
		if Random_Rock == 1:
			$Rock1.show()
			$Nuke.hide()
		elif Random_Rock == 2:
			$Rock2.show()
			$Nuke.hide()
		elif Random_Rock == 3:
			$Rock3.show()
			$Nuke.hide()
		neg_spawn_radius = -509
		spawn_radius = -445
		neg_spawn_radius2 = -300
		spawn_radius2 = 194
		neg_spawn_radius3 = 524
		spawn_radius3 = 461
	if Modifier.current_map == "map13":
		$Bomb.queue_free()
		if Random_Rock == 1:
			$Rock1.show()
			$Nuke.hide()
		elif Random_Rock == 2:
			$Rock2.show()
			$Nuke.hide()
		elif Random_Rock == 3:
			$Rock3.show()
			$Nuke.hide()
		neg_spawn_radius = -315
		spawn_radius = 137
		neg_spawn_radius2 = -527
		spawn_radius2 = -315
		neg_spawn_radius3 = 137
		spawn_radius3 = 454
	if Modifier.current_map == "menu":
		$Rock.queue_free()
		neg_spawn_radius = -100
		spawn_radius = 500
		neg_spawn_radius2 = -100
		spawn_radius2 = 500
		neg_spawn_radius3 = -100
		spawn_radius3 = 500
	if Modifier.current_map == "credits":
		$Rock.queue_free()
		neg_spawn_radius = -600
		spawn_radius = -230
		neg_spawn_radius2 = -230
		spawn_radius2 = 230
		neg_spawn_radius3 = 230
		spawn_radius3 = 600

	# Randomize the spawn within the chosen combines from above ^
	if random_spawn_but_like_more == 1:
		position.x = randi_range(neg_spawn_radius, spawn_radius)
	elif random_spawn_but_like_more == 2:
		position.x = randi_range(neg_spawn_radius2, spawn_radius2)
	elif random_spawn_but_like_more == 3:
		position.x = randi_range(neg_spawn_radius3, spawn_radius3)
	
	# If the follow modifier does not exist, set the normal falling code.
	if Modifier.Follow == false:
		if randi_range(move_x1, move_x2) == 2:
			if position.x <= 0:
				move_x = -1
			else:
				move_x = 1
		else:
			move_x = 0
	else:
		move_x = 0
		Randi_Player = randi_range(0,4)
		_chooseplayer()
	
	# Disables collision with nuke pre-explosion.
	$BlastRadius/CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# If the follow modifier does not exist, use the normal falling code and reverse it on flip grav maps.
	if Modifier.Follow == false:
		if move == true:
			if Modifier.current_map != "map7" and Modifier.current_map != "map8" and Modifier.current_map != "map11":
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
	else:
		# If the follow modifier exists, move the bombs x pos to the chosen players x pos until it hits a certain y pos
		if move == true:
			if position.y <= -325:
				position.x = Modifier.player_X[Randi_Player]
			if Modifier.current_map == "map7" or Modifier.current_map == "map8" or Modifier.current_map == "map11":
				position.y += rand_move_speed_Y
				upsidedown_bomb = true
			else :
				position.y += rand_move_speed
				upsidedown_bomb = false

#Pre-Launching Exceptions and Arguments
func prelaunch(body):
	#If have a shield pass the explosion
	if body.has_meta("Shield") == true:
		if body.get_meta("Shield") == true:
			body.set_meta("Shield", false)
		else:
			launch(body)
	else:
		launch(body)

# Launches the player in the direction away from the explosion
func launch(body):
	#Change Y Launch for the Smash_bros gamemode.
	if Modifier.Smash_bros == true:
		exp_speed = 1200
		#Launches Player by getting their position and direction compared to the middle of the bomb (explosion point).
	body.velocity = (Explosive_Point.global_position.direction_to(body.global_position) * exp_speed) * (Modifier.P_Speed / Halfit)
	
		#Change Y Launch for the Smash_bros gamemode.
	if Modifier.Smash_bros:
		pass
	else:
		if upsidedown_bomb == true:
			body.velocity.y = -randi_range(-450, -750) * (Modifier.P_Speed / Halfit)
		else:
			body.velocity.y = randi_range(-450, -750) * (Modifier.P_Speed / Halfit)
	# Makes it harder to control midair
	if Modifier.Smash_bros == true:
		body.aircontrol -= 0.01

# Delete Itself
func _on_explodimer_timeout():
	queue_free()

# Blasts the player
func _on_blast_radius_body_entered(body):
	if move == false:
		if body.has_meta("Player"):
			prelaunch(body)
		# Move land down on impaction gamemode
		elif Modifier.Impaction == true:
			body.position.y += randi_range(10, 20)
		# Move down on crumble gamemode, then move it up later
		elif Modifier.Crumble == true:
			body.position.y += 1000
			body.timer.start()

# Chooses a player to follow on homing gamemode
func _chooseplayer():
	# Homing bomb chooses a player to home on.
	if Randi_Player == 0 and Modifier.P1_Alive == true:
		print("1")
	elif Randi_Player == 1 and Modifier.P2_Alive == true:
		print("2")
	elif Randi_Player == 2 and Modifier.P3_Alive == true:
		print("3")
	elif Randi_Player == 3 and Modifier.P4_Alive == true:
		print("4")
	elif Randi_Player == 4 and Modifier.P5_Alive == true:
		print("5")
	else:
		# If chosen player dead, re-chose the player
		Randi_Player = randi_range(0,4)
		_chooseplayer()

# Explosion Script
func _on_body_entered(body):
	var Expl = Explosion.instantiate()
	if body.name == "BlastRadius":
		pass
	# Only moves the player based on metadata
	if body.has_meta("PlayerOnly"):
		if body.get_meta("PlayerOnly") == true:
			pass
	else:
		move = false
		raidus.set_deferred("disabled", false)
		# Adds Particles
		get_parent().add_child(Expl)
		# Colors particles to be rock on rock maps, otherwise gets the color of the ground.
		if Modifier.current_map == "map9" or Modifier.current_map == "map10" or Modifier.current_map == "map12" or Modifier.current_map == "map13":
			Expl.get_child(0).color = Color(0.306, 0.133, 0)
		else:
			Expl.get_child(0).color = Color(body.get_child(0).color)
		# kills the bomb and stuff
		Expl.position = position
		Expl.get_child(0).one_shot = true
		Nuke.hide()
		$Rock1.hide()
		$Rock2.hide()
		$Rock3.hide()
		Explosive_Anim.show()
		Explosive_Anim.play("Explosion")
		timer.start()


