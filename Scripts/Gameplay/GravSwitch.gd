extends Node
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_grav_switch_1_body_entered(body):
	if body.gravity > 0:
		if Modifier.Crumble == true:
			body.velocity += Vector2(0, 250)
		else:
			body.velocity += Vector2(0, 100)
		body.up_direction = Vector2(0, 1)
	else:
		if Modifier.Crumble == true:
			body.velocity += Vector2(0, -250)
		else:
			body.velocity += Vector2(0, -100)
		body.up_direction = Vector2(0, -1)
	body.gravity = -body.gravity
	body.JUMP_VELOCITY = -body.JUMP_VELOCITY
