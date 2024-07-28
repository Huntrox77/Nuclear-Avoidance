extends Node2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var anim = $AnimatedSprite2D
@onready var timer = $Explodimer
@onready var raidus = $BlastRadius/CollisionShape2D
@onready var ExplosivePoint = $BlastRadius/ExplosivePoint
@onready var AnimSprite = $AnimatedSprite2D
@onready var Sprite = $Sprite2D

var randmovespeed = randf_range(0.33, 4.33)
var move = true
var splosion = false
var negspawnradius = -234
var spawnradius = 234
var expspeed = 3100
var randiY = randi_range(1, 3)
var movex = 0
var movex1 = 1
var movex2 = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	movex2 = 10 - Modifier.DMNSC
	if Modifier.Yharon == true:
		Sprite.show()
		AnimSprite.hide()
	else:
		Sprite.hide()
		AnimSprite.show()
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
	if Modifier.currentmap == "map2":
		negspawnradius = -464
		spawnradius = 464
	if Modifier.currentmap == "map3":
		negspawnradius = -664
		spawnradius = 464
	if Modifier.currentmap == "map5":
		negspawnradius = -664
		spawnradius = 464
	position.x = randi_range(negspawnradius, spawnradius)
	if randi_range(movex1, movex2) == 2:
		if position.x <= 0:
			movex = -1
		else:
			movex = 1
	else:
		movex = 0

	$BlastRadius/CollisionShape2D.disabled = true #disables collision with nuke pre-explosion


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if move == true:
		if movex == -1:
			position -= Vector2(-randmovespeed * 0.5, -randmovespeed) #Positive Diagonal Movement
		elif movex == 1:
			position -= Vector2(randmovespeed * 0.5, -randmovespeed) #Diagonal Movement
		elif movex == 0:
			position += Vector2(0, randmovespeed) #Movement

# Launches the player in the direction away from the explosion
func launch(body):
	#Change Y Launch for the smashbros gamemode.
	if Modifier.Smashbros == true:
		expspeed = 1200
		#Launches Player
	body.velocity = (ExplosivePoint.global_position.direction_to(body.global_position) * expspeed)
	
		#Change Y Launch for the smashbros gamemode.
	if Modifier.Smashbros:
		pass
	else:
		body.velocity.y = randi_range(-300, -600)
	
	if Modifier.Smashbros == true:
		body.aircontrol -= 0.01

# Delete Itself
func _on_explodimer_timeout():
	queue_free()

# Blasts the player
func _on_blast_radius_body_entered(body):
	if move == false:
		if body.has_meta("Player"):
			launch(body)
		elif Modifier.Impaction == true:
			body.position.y += randi_range(10, 20)
		elif Modifier.Crumble == true:
			body.position.y += 1000
			body.timer.start()


# Explosion Script
func _on_body_entered(body):
	if body.name == "BlastRadius":
		pass
	if body.has_meta("PlayerOnly"):
		if body.get_meta("PlayerOnly") == true:
			pass
	else:
		move = false
		raidus.set_deferred("disabled", false)
		anim.play("Explosion")
		timer.start()
