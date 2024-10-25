extends Node
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Reverses or normalizes gravity based on the players meta data by detecting it tthen changing its gravity and boosting it a little.
func _on_grav_switch_1_body_entered(body):
	if body.has_meta("UpsideDown"):
		body.remove_meta("UpsideDown")
	else:
		body.set_meta("UpsideDown", true)
	if body.gravity > 0:
		if Modifier.Crumble == true:
			body.velocity += Vector2(0, 250)
		else:
			body.velocity += Vector2(0, 100)
		body.up_direction = Vector2(0, 1)
		_rotate(180, body)
	else:
		if Modifier.Crumble == true:
			body.velocity += Vector2(0, -250)
		else:
			body.velocity += Vector2(0, -100)
		body.up_direction = Vector2(0, -1)
		_rotate(180, body)
	body.gravity = -body.gravity
	body.Jump_Velocity = -body.Jump_Velocity


func _on_timer_timeout():
	$DeleteSwitch.queue_free()


func _rotate(deg, body):
	var Start_Deg = 0
	while not Start_Deg == deg:
		Start_Deg += 5
		body.set_rotation_degrees(body.get_rotation_degrees() + 5)
		var timer = get_tree().create_timer(0.01)
		timer.connect("timeout", _useless)
		await timer.timeout


func _useless():
	pass



# Reverses or normalizes gravity based on the players meta data by detecting it then changing its gravity,
# and boosting it more than usual because of the crumble modifier otherwise players would lose instantly.
func _on_delete_switch_body_entered(body):
	if body.gravity > 0:
		if Modifier.Crumble == true:
			body.velocity += Vector2(0, 250)
		else:
			body.velocity += Vector2(0, 100)
		body.up_direction = Vector2(0, 1)
		body.set_rotation_degrees(body.get_rotation_degrees() + 180)
	else:
		if Modifier.Crumble == true:
			body.velocity += Vector2(0, -250)
		else:
			body.velocity += Vector2(0, -100)
		body.up_direction = Vector2(0, -1)
		body.set_rotation_degrees(body.get_rotation_degrees() + 180)
	body.gravity = -body.gravity
	body.Jump_Velocity = -body.Jump_Velocity
