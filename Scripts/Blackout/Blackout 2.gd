extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	if randi_range(1, 2) == 1:
		hide()
	else:
		show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
