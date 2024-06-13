extends Node2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var anim = $AnimatedSprite2D
@onready var timer = $Explodimer
@onready var raidus = $BlastRadius/CollisionShape2D
@onready var ExplosivePoint = $BlastRadius/ExplosivePoint

var randmovespeed = randf_range(0.5, 2)
var move = true
var splosion = false
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print(randmovespeed)
	position.x = randi_range(-234, 234)
	$BlastRadius/CollisionShape2D.disabled = true #disables collision with nuke pre-explosion


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if move == true:
		position += Vector2(0, randmovespeed) # Movement

# Launches the player in the direction away from the explosion
func launch(body):
	body.velocity = -(body.global_position.direction_to(ExplosivePoint.global_position).normalized() * 900)
	if Modifier.Smashbros == true:
		body.aircontrol -= 0.01

# Explosion Script
func _on_area_entered(_area):
	if _area.name == "BlastRadius":
		pass
	else:
		move = false
		raidus.set_deferred("disabled", false)
		anim.play("Explosion")
		timer.start()

# Delete Itself
func _on_explodimer_timeout():
	queue_free()

# Blasts the player
func _on_blast_radius_body_entered(body):
	if move == false:
		if body.has_meta("Player"):
			launch(body)
