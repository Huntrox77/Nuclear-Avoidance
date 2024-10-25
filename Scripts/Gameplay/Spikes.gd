extends Node
@onready var Modifier = get_node("/root/Modifiers")
var exp_speed = 4200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# launches player on spike enter
func _on_spike_body_entered(body):
	var randi_vel_y = randi_range(-600, -1200)
	var randi_vel_x = randi_range(-2400, 2400)
	body.velocity = Vector2(randi_vel_x, randi_vel_y)


func _on_spike_2_body_entered(body):
	var randi_vel_y = randi_range(-600, -1200)
	var randi_vel_x = randi_range(-2400, 2400)
	body.velocity = Vector2(randi_vel_x, randi_vel_y)


func _on_spike_3_body_entered(body):
	var randi_vel_y = randi_range(-600, -1200)
	var randi_vel_x = randi_range(-2400, 2400)
	body.velocity = Vector2(randi_vel_x, randi_vel_y)
