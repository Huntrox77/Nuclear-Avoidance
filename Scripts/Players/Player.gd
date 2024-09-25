extends CharacterBody2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var SpawnPos1 = get_parent().get_parent().get_child(8).get_child(0)
@onready var SpawnPos2 = get_parent().get_parent().get_child(8).get_child(1)
@onready var SpawnPos3 = get_parent().get_parent().get_child(8).get_child(2)
@onready var SpawnPos4 = get_parent().get_parent().get_child(8).get_child(3)
@onready var Sprite = $Sprite
@onready var Shape = $ColorRect
var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var airslide = 0.02
var aircontrol = 0.09
var groundslide = 0.5
var coyotetime = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Shield.hide()
	SPEED = 3 * Modifier.PSpeed
	var randi_spawn = randi_range(1, 4)
	#Funny Sprite Enabling
	if Modifier.Clam == true:
		Sprite.show()
		Shape.hide()
	#Random Spawn
	if randi_spawn == 1:
		position = SpawnPos1.position
		position.y -= 25
	elif randi_spawn == 2:
		position = SpawnPos2.position
	elif randi_spawn == 3:
		position = SpawnPos3.position
		if Modifier.currentmap == "map7" or Modifier.currentmap == "map8":
			gravity = -gravity
			JUMP_VELOCITY = -JUMP_VELOCITY
			up_direction = Vector2(0, 1)
	elif randi_spawn == 4:
		position = SpawnPos4.position
		if Modifier.currentmap == "map7" or Modifier.currentmap == "map8":
			gravity = -gravity
			JUMP_VELOCITY = -JUMP_VELOCITY
			up_direction = Vector2(0, 1)

func _physics_process(delta):
	if name == "Player 1":
		Modifier.playerX[0] = position.x
	if name == "Player 2":
		Modifier.playerX[1] = position.x
	if name == "Player 3":
		Modifier.playerX[2] = position.x
	if name == "Player 4":
		Modifier.playerX[3] = position.x
	if name == "Player 5":
		Modifier.playerX[4] = position.x
	#Funny Sprite Enabling
	if Modifier.Ice == true:
		groundslide = 0.01
		aircontrol = 0.01
	# Kills player if they dont exist
	if Modifier.p1selection == false:
		if name == "Player 1":
			queue_free()
	if Modifier.p2selection == false:
		if name == "Player 2":
			queue_free()
	if Modifier.p3selection == false:
		if name == "Player 3":
			queue_free()
	if Modifier.p4selection == false:
		if name == "Player 4":
			queue_free()
	if Modifier.p5selection == false:
		if name == "Player 5":
			queue_free()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	Modifier.p1aircontrol = aircontrol

	# Handle Controls
	if Modifier.CountdownFinished == true:
		var direction = Input.get_axis("p1-left", "p1-right")
		if name == "Player 1":
			direction = Input.get_axis("p1-left", "p1-right")
			if Input.is_action_pressed("p1-jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p1-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false
		if name == "Player 2":
			direction = Input.get_axis("p2-left", "p2-right")
			if Input.is_action_pressed("p2-jump") and is_on_floor():
				if is_on_floor():
					coyotetime = false
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p2-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false
		if name == "Player 3":
			direction = Input.get_axis("p3-left", "p3-right")
			if Input.is_action_pressed("p3-jump") and is_on_floor():
				if is_on_floor():
					coyotetime = false
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p3-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false
		if name == "Player 4":
			direction = Input.get_axis("p4-left", "p4-right")
			if Input.is_action_pressed("p4-jump") and is_on_floor():
				if is_on_floor():
					coyotetime = false
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p4-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false
		if name == "Player 5":
			direction = Input.get_axis("p5-left", "p5-right")
			if Input.is_action_pressed("p5-jump") and is_on_floor():
				if is_on_floor():
					coyotetime = false
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p5-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false


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

func _process(_delta):
	if is_on_floor():
		coyotetime = true

	if not is_on_floor():
		var timer = get_tree().create_timer(0.1)
		timer.connect("timeout", _coyotetime)

	if has_meta("Shield"):
		if get_meta("Shield", true):
			$Shield.show()
		else:
			$Shield.hide()

func _coyotetime():
	coyotetime = false
