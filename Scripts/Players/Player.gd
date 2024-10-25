class_name Player extends CharacterBody2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var Global_Var = get_node("/root/Moreglobalvars")
@onready var Spawn_Pos1 = get_parent().get_parent().get_child(8).get_child(0)
@onready var Spawn_Pos2 = get_parent().get_parent().get_child(8).get_child(1)
@onready var Spawn_Pos3 = get_parent().get_parent().get_child(8).get_child(2)
@onready var Spawn_Pos4 = get_parent().get_parent().get_child(8).get_child(3)
@onready var Sprite = $Sprite
@onready var Shape = $ColorRect
var speed = 300.0
var Jump_Velocity = -400.0
var air_slide = 0.02
var air_control = 0.09
var ground_slide = 0.5
var coyote_time = true
var not_spawned = true
var spring
var audio = AudioStreamPlayer2D.new()
var jump_noise = preload("res://Sounds/jump2.wav")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	# adds jump noise
	add_child(audio)
	audio.set_stream(jump_noise)
	# Kills player if they are not meant to exist
	if Modifier.p1_selection == false:
		if name == "Player 1":
			queue_free()
	if Modifier.p2_selection == false:
		if name == "Player 2":
			queue_free()
	if Modifier.p3_selection == false:
		if name == "Player 3":
			queue_free()
	if Modifier.p4_selection == false:
		if name == "Player 4":
			queue_free()
	if Modifier.p5_selection == false:
		if name == "Player 5":
			queue_free()
	
	# Toggles any vanity
	show()
	$Shield.hide()
	spring = get_node("Spring")
	spring.hide()
	
	# sets player speed based on the adv modifier.
	speed = 3 * Modifier.P_Speed
	# Funny sprite color
	if name == "Player 1":
		get_child(0).color = Modifier.p1_color
	if name == "Player 2":
		get_child(0).color = Modifier.p2_color
	if name == "Player 3":
		get_child(0).color = Modifier.p3_color
	if name == "Player 4":
		get_child(0).color = Modifier.p4_color
	# Funny Sprite Enabling
	if Modifier.Clam == true:
		Sprite.show()
		Shape.hide()

func _physics_process(delta):
	#Funny Sprite Enabling
	if Modifier.Ice == true:
		ground_slide = 0.01
		air_control = 0.01

	# Add the gravity.
	if not is_on_floor():
		if has_meta("Ladder"):
			if has_meta("UpsideDown"):
				velocity.y = 100
				air_slide = 0.5
			else:
				velocity.y = -100
				air_slide = 0.5
		else:
			velocity.y += gravity * delta
			air_slide = 0.02
	
	if name == "Player 1":
		Modifier.p1_air_control = air_control
	if name == "Player 2":
		Modifier.p2_air_control = air_control
	if name == "Player 3":
		Modifier.p3_air_control = air_control
	if name == "Player 4":
		Modifier.p4_air_control = air_control
	

	# Handle Controls by getting left and right and jump for each player the applying that to the actual player and send their x pos to the global vars
	if Modifier.Countdown_Finished == true:
		var direction = Input.get_axis("p1-left", "p1-right")
		if name == "Player 1":
			Modifier.player_X[0] = position.x
			direction = Input.get_axis("p1-left", "p1-right")
			if Input.is_action_pressed("p1-jump") and is_on_floor():
				velocity.y = Jump_Velocity
				audio.play()
			elif Input.is_action_pressed("p1-jump") and coyote_time == true:
				velocity.y = Jump_Velocity
				audio.play()
				coyote_time = false
		if name == "Player 2":
			Modifier.player_X[1] = position.x
			direction = Input.get_axis("p2-left", "p2-right")
			if Input.is_action_pressed("p2-jump") and is_on_floor():
				if is_on_floor():
					coyote_time = false
				velocity.y = Jump_Velocity
				audio.play()
			elif Input.is_action_pressed("p2-jump") and coyote_time == true:
				velocity.y = Jump_Velocity
				audio.play()
				coyote_time = false
		if name == "Player 3":
			Modifier.player_X[2] = position.x
			direction = Input.get_axis("p3-left", "p3-right")
			if Input.is_action_pressed("p3-jump") and is_on_floor():
				if is_on_floor():
					coyote_time = false
				velocity.y = Jump_Velocity
				audio.play()
			elif Input.is_action_pressed("p3-jump") and coyote_time == true:
				velocity.y = Jump_Velocity
				audio.play()
				coyote_time = false
		if name == "Player 4":
			Modifier.player_X[3] = position.x
			direction = Input.get_axis("p4-left", "p4-right")
			if Input.is_action_pressed("p4-jump") and is_on_floor():
				if is_on_floor():
					coyote_time = false
				velocity.y = Jump_Velocity
				audio.play()
			elif Input.is_action_pressed("p4-jump") and coyote_time == true:
				velocity.y = Jump_Velocity
				audio.play()
				coyote_time = false
		if name == "Player 5":
			Modifier.player_X[4] = position.x
			direction = Input.get_axis("p5-left", "p5-right")
			if Input.is_action_pressed("p5-jump") and is_on_floor():
				if is_on_floor():
					coyote_time = false
				velocity.y = Jump_Velocity
				audio.play()
			elif Input.is_action_pressed("p5-jump") and coyote_time == true:
				velocity.y = Jump_Velocity
				audio.play()
				coyote_time = false


# moves the spring vanity on the player to face the direction of the player
		if Modifier.Reverse == false:
			if direction:
				spring.scale.x = direction
				spring.position.x = direction * 30
			# Handles friction on the floor and in the air.
				if is_on_floor():
					velocity.x = lerp(velocity.x, direction * speed, ground_slide)
				if not is_on_floor():
					velocity.x = lerp(velocity.x, direction * speed, air_control)
			elif is_on_floor():
				velocity.x = lerp(velocity.x, 0.0, ground_slide)
			else:
				velocity.x = lerp(velocity.x, 0.0, air_slide)
		else:
			if direction:
				spring.scale.x = -direction
				spring.position.x = -direction * 30
			# Handles friction on the floor and in the air.
				if is_on_floor():
					velocity.x = lerp(velocity.x, -direction * speed, ground_slide)
				if not is_on_floor():
					velocity.x = lerp(velocity.x, -direction * speed, air_control)
			elif is_on_floor():
				velocity.x = lerp(velocity.x, 0.0, ground_slide)
			else:
				velocity.x = lerp(velocity.x, 0.0, air_slide)
	
	move_and_slide()


#handles everything that doesnt need to be ran in the movement script.
# Handles coyote time and power-ups
func _process(_delta):
	if is_on_floor():
		coyote_time = true

	if not is_on_floor():
		var timer = get_tree().create_timer(0.1)
		timer.connect("timeout", _coyote_time)

	if has_meta("Shield"):
		if get_meta("Shield", true):
			$Shield.show()
		else:
			$Shield.hide()

	if has_meta("Spring"):
		if get_meta("Spring", true):
			spring.show()
			var timer = get_tree().create_timer(5.0)
			timer.connect("timeout", _kill_spring)
		else:
			spring.hide()

#sets false
func _coyote_time():
	coyote_time = false

#turns off the spring my removing the metadata
func _kill_spring():
	set_meta("Spring", false)


#launches player hit by the spring.
func _on_spring_body_entered(body):
	if has_meta("Spring"):
		if get_meta("Spring", true):
			if body.has_meta("Player"):
				if not body == self:
					body.velocity = (global_position.direction_to(body.global_position) * 3100)
					body.velocity.y = randi_range(-300, -600)
