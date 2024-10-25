extends CharacterBody2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var Sprite = $Sprite
@onready var Shape = $ColorRect
var speed = 300.0
var Jump_Velocity = -400.0
var air_slide = 0.02
var air_control = 0.09
var ground_slide = 0.5
var audio = AudioStreamPlayer2D.new()
var jump_noise = preload("res://Sounds/jump2.wav")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	add_child(audio)
	audio.set_stream(jump_noise)

func _physics_process(delta):
	#Funny Sprite Enabling
	if Modifier.Ice == true:
		ground_slide = 0.01
		air_control = 0.01
	# Kills player if they dont exist
	if Modifier.p1_selection == false:
		queue_free()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	Modifier.p1_air_control = air_control

	# Handle jump.
	if Input.is_action_pressed("p1-jump") and is_on_floor():
		velocity.y = Jump_Velocity
		audio.play()
	
	
# Left makes direction left and vice versa
	var direction = Input.get_axis("p1-left", "p1-right")

# Handles movement / friction on ground and air
	if direction:
		if is_on_floor():
			velocity.x = lerp(velocity.x, direction * speed, ground_slide)
		if not is_on_floor():
			velocity.x = lerp(velocity.x, direction * speed, air_control)
	elif is_on_floor():
		velocity.x = lerp(velocity.x, 0.0, ground_slide)
	else:
		velocity.x = lerp(velocity.x, 0.0, air_slide)
	
	

	move_and_slide()
