extends Node2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var timer = $Explodimer
@onready var raidus = $BlastRadius/CollisionShape2D
@onready var ExplosivePoint = $BlastRadius/ExplosivePoint
@onready var ExplosiveAnim = $Explosion
@onready var Nuke = $Nuke
@onready var Yharon = $Yharon
@export var Explosion:PackedScene

var randmovespeed = randf_range(0.33, 4.33)
var randmovespeedY = randf_range(-4.33, 4.33)
var upsidedownbomb = false
var randomspawnbutlikemore = randi_range(1,3)
var move = true
var splosion = false
var negspawnradius = -234
var spawnradius = 234
var negspawnradius2 = -234
var spawnradius2 = 234
var negspawnradius3 = -234
var spawnradius3 = 234
var expspeed = 4200
var randiY = randi_range(1, 3)
var RandiPlayer = randi_range(0, 4)
var movex = 0
var movex1 = 1
var movex2 = 4
var Halfit = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	if Modifier.currentmap == "map7" or Modifier.currentmap == "map8":
		if randmovespeedY <= 0:
			position.y = 32
			rotation = 135
	if Modifier.PSpeed >= 149:
		Halfit = 50
	elif Modifier.PSpeed <= 51:
		Halfit = 50
	else:
		Halfit = 100
	randomspawnbutlikemore = randi_range(1,3)
	movex2 = 10 - Modifier.DMNSC
	if Modifier.Yharon == true:
		Yharon.show()
		ExplosiveAnim.hide()
		Nuke.hide()
	else:
		Yharon.hide()
		ExplosiveAnim.hide()
		Nuke.show()
	if self.name == "Nuke2":
		if Modifier.Nuke2 == false:
			self.queue_free()
	if self.name == "Nuke3":
		if Modifier.Nuke3 == false:
			self.queue_free()
	if self.name == "Nuke4":
		if Modifier.Nuke4 == false:
			self.queue_free()
			
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
	
	if Modifier.Follow == false:
		if randi_range(movex1, movex2) == 2:
			if position.x <= 0:
				movex = -1
			else:
				movex = 1
		else:
			movex = 0
	else:
		movex = 0
		RandiPlayer = randi_range(0,4)
		_chooseplayer()

	$BlastRadius/CollisionShape2D.disabled = true #disables collision with nuke pre-explosion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Follow == false:
		if move == true:
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
	else:
		if move == true:
			if position.y <= -325:
				position.x = Modifier.playerX[RandiPlayer]
			if Modifier.currentmap == "map7" or Modifier.currentmap == "map8":
				position.y += randmovespeedY
				upsidedownbomb = true
			else :
				position.y += randmovespeed
				upsidedownbomb = false

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
	#Change Y Launch for the smashbros gamemode.
	if Modifier.Smashbros == true:
		expspeed = 1200
		#Launches Player
	body.velocity = (ExplosivePoint.global_position.direction_to(body.global_position) * expspeed) * (Modifier.PSpeed / Halfit)
	
		#Change Y Launch for the smashbros gamemode.
	if Modifier.Smashbros:
		pass
	else:
		if upsidedownbomb == true:
			body.velocity.y = -randi_range(-450, -750) * (Modifier.PSpeed / Halfit)
		else:
			body.velocity.y = randi_range(-450, -750) * (Modifier.PSpeed / Halfit)
	
	if Modifier.Smashbros == true:
		body.aircontrol -= 0.01

# Delete Itself
func _on_explodimer_timeout():
	queue_free()

# Blasts the player
func _on_blast_radius_body_entered(body):
	if move == false:
		if body.has_meta("Player"):
			prelaunch(body)
		elif Modifier.Impaction == true:
			body.position.y += randi_range(10, 20)
		elif Modifier.Crumble == true:
			body.position.y += 1000
			body.timer.start()

# Chooses a player to follow on hominh gamemode
func _chooseplayer():
	if RandiPlayer == 0 and Modifier.P1Alive == true:
		pass
	elif RandiPlayer == 1 and Modifier.P2Alive == true:
		pass
	elif RandiPlayer == 2 and Modifier.P3Alive == true:
		pass
	elif RandiPlayer == 3 and Modifier.P4Alive == true:
		pass
	elif RandiPlayer == 4 and Modifier.P5Alive == true:
		pass
	else:
		RandiPlayer = randi_range(0,4)
		_chooseplayer()

# Explosion Script
func _on_body_entered(body):
	var Expl = Explosion.instantiate()
	if body.name == "BlastRadius":
		pass
	if body.has_meta("PlayerOnly"):
		if body.get_meta("PlayerOnly") == true:
			pass
	else:
		move = false
		raidus.set_deferred("disabled", false)
		get_parent().add_child(Expl)
		Expl.get_child(0).color = Color(body.get_child(0).color)
		Expl.position = position
		Expl.get_child(0).one_shot = true
		Nuke.hide()
		ExplosiveAnim.show()
		ExplosiveAnim.play("Explosion")
		timer.start()


