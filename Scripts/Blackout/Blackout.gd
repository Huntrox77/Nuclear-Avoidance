extends ColorRect

# Choses whether to spawn each individual blackout or not
func _ready():
	if randi_range(1,2) == 1:
		pass
	else:
		queue_free()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass

# Rids the world of the blackouts
func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
