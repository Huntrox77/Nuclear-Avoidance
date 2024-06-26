extends CharacterBody2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var Sprite = $Sprite
@onready var Shape = $ColorRect
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var airslide = 0.02
var aircontrol = 0.09
var groundslide = 0.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	var randi_spawn = randi_range(1, 4)
	if Modifier.Clam == true:
		Sprite.show()
		Shape.hide()
		
	if Modifier.currentmap == "map1":
		if randi_spawn == 1:
			position.x = 145
		elif randi_spawn == 2:
			position.x = -145
		elif randi_spawn == 3:
			position.x = 48
		elif randi_spawn == 4:
			position.x = -48
	elif Modifier.currentmap == "map2":
		if randi_spawn == 1:
			position.x = -50
		elif randi_spawn == 2:
			position.x = -412
		elif randi_spawn == 3:
			position.x = 48
		elif randi_spawn == 4:
			position.x = 416
	elif Modifier.currentmap == "map3":
		if randi_spawn == 1:
			position.x = -467
		elif randi_spawn == 2:
			position.x = 471
		elif randi_spawn == 3:
			position.x = -467
		elif randi_spawn == 4:
			position.x = 471
	elif Modifier.currentmap == "map4":
		if randi_spawn == 1:
			position.x = -50
		elif randi_spawn == 2:
			position.x = -412
		elif randi_spawn == 3:
			position.x = 48
		elif randi_spawn == 4:
			position.x = 416
	elif Modifier.currentmap == "map5":
		if randi_spawn == 1:
			position.y = -530
		elif randi_spawn == 2:
			position.y = -430
		elif randi_spawn == 3:
			position.y = -330
		elif randi_spawn == 4:
			position.y = -530
	
func _physics_process(delta):
	if Modifier.Ice == true:
		groundslide = 0.01
		aircontrol = 0.01
	# Kills player if they dont exist
	if Modifier.p3selection == false:
		queue_free()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	Modifier.p3aircontrol = aircontrol

	# Handle jump.
	if Input.is_action_pressed("p3-jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("p3-left", "p3-right")

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
