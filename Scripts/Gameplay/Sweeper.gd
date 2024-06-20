extends Area2D
@onready var Modifier = get_node("/root/Modifiers")
var sweepingdir = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if Modifier.currentmap == "map2":
		if randi_range(1,2) == 1:
			sweepingdir = not sweepingdir
	if randi_range(1,2) == 1:
		position.x = -287
		position.y = -176
	else:
		position.x = 287
		position.y = -176
		sweepingdir = not sweepingdir
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Sweeper == true:
		if sweepingdir == false:
			position += Vector2(5, 0) # Movement
			scale.x = 1
		else:
			position += Vector2(-5, 0) # Movement
			scale.x = -1
	pass


func _on_body_entered(body):
	body.velocity = (self.global_position.direction_to(body.global_position) * 3100)
	body.velocity.y = randi_range(-300, -600)
	pass # Replace with function body.


func _on_kill_thy_self_timeout():
	queue_free()
	pass # Replace with function body.


func _on_sweepingtime_timeout():
	sweepingdir = not sweepingdir
	pass # Replace with function body.
