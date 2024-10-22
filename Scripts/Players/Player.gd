class_name Player extends CharacterBody2D

@onready var Modifier = get_node("/root/Modifiers")
@onready var GlobalVar = get_node("/root/Moreglobalvars")
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
var notspawned = true
var spring
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
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

	show()
	$Shield.hide()
	spring = get_node("Spring")
	spring.hide()
	
	SPEED = 3 * Modifier.PSpeed
	#Funny Sprite Enabling
	if Modifier.Clam == true:
		Sprite.show()
		Shape.hide()

func _physics_process(delta):
	#Funny Sprite Enabling
	if Modifier.Ice == true:
		groundslide = 0.01
		aircontrol = 0.01

	# Add the gravity.
	if not is_on_floor():
		if has_meta("Ladder"):
			velocity.y = -100
			airslide = 0.5
		else:
			velocity.y += gravity * delta
			airslide = 0.02
	
	Modifier.p1aircontrol = aircontrol

	# Handle Controls
	if Modifier.CountdownFinished == true:
		var direction = Input.get_axis("p1-left", "p1-right")
		if name == "Player 1":
			Modifier.playerX[0] = position.x
			direction = Input.get_axis("p1-left", "p1-right")
			if Input.is_action_pressed("p1-jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p1-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false
		if name == "Player 2":
			Modifier.playerX[1] = position.x
			direction = Input.get_axis("p2-left", "p2-right")
			if Input.is_action_pressed("p2-jump") and is_on_floor():
				if is_on_floor():
					coyotetime = false
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p2-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false
		if name == "Player 3":
			Modifier.playerX[2] = position.x
			direction = Input.get_axis("p3-left", "p3-right")
			if Input.is_action_pressed("p3-jump") and is_on_floor():
				if is_on_floor():
					coyotetime = false
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p3-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false
		if name == "Player 4":
			Modifier.playerX[3] = position.x
			direction = Input.get_axis("p4-left", "p4-right")
			if Input.is_action_pressed("p4-jump") and is_on_floor():
				if is_on_floor():
					coyotetime = false
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p4-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false
		if name == "Player 5":
			Modifier.playerX[4] = position.x
			direction = Input.get_axis("p5-left", "p5-right")
			if Input.is_action_pressed("p5-jump") and is_on_floor():
				if is_on_floor():
					coyotetime = false
				velocity.y = JUMP_VELOCITY
			elif Input.is_action_pressed("p5-jump") and coyotetime == true:
				velocity.y = JUMP_VELOCITY
				coyotetime = false


		if direction:
			spring.scale.x = direction
			spring.position.x = direction * 30
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

	if has_meta("Spring"):
		if get_meta("Spring", true):
			spring.show()
			var timer = get_tree().create_timer(5.0)
			timer.connect("timeout", _killspring)
		else:
			spring.hide()

func _coyotetime():
	coyotetime = false

func _killspring():
	set_meta("Spring", false)


func _on_spring_body_entered(body):
	if has_meta("Spring"):
		if get_meta("Spring", true):
			if body.has_meta("Player"):
				if body != self:
					body.velocity = (global_position.direction_to(body.global_position) * 3100)
					body.velocity.y = randi_range(-300, -600)
