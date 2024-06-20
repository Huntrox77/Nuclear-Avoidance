extends CharacterBody2D

@onready var Modifier = get_node("/root/Modifiers")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var airslide = 0.02
var aircontrol = 0.09
var groundslide = 0.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if Modifier.Ice == true:
		groundslide = 0.01
		aircontrol = 0.01
	# Kills player if they dont exist
	if Modifier.p1selection == false:
		queue_free()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	Modifier.p1aircontrol = aircontrol	

	# Handle jump.
	if Input.is_action_pressed("p1-jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("p1-left", "p1-right")

	if direction:
		if is_on_floor():
			velocity.x = lerp(velocity.x, direction * SPEED, groundslide)
		if not is_on_floor():
			velocity.x = lerp(velocity.x, direction * SPEED, aircontrol)
	elif is_on_floor():
		velocity.x = lerp(velocity.x, 0.0, groundslide)
	else:
		velocity.x = lerp(velocity.x, 0.0, airslide)
	
	

	move_and_slide()
