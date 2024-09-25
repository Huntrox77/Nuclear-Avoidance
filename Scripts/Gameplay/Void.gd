extends Area2D
@onready var Modifier = get_node("/root/Modifiers")
var Players = null
# Called when the node enters the scene tree for the first time.
func _ready():
	if Modifier.gameplaying == true:
		if name == "void2":
			pass
		else:
			if Modifier.currentmap == "map7" or Modifier.currentmap == "map8":
				$FP.play()
				$FP.pitch_scale = randf_range(0.90, 1.10)
			else:
				if randi_range(1,2) == 1:
					$SkyIslands.play()
					$SkyIslands.pitch_scale = randf_range(0.90, 1.10)
				else:
					$Outskirts.play()
					$Outskirts.pitch_scale = randf_range(0.90, 1.10)
	if name == "void":
		Players = get_parent().get_child(2).get_children()
		$ColorRect.hide()
		$RichTextLabel.hide()
		if Modifier.Collide == true:
			for i in Players:
				i.get_child(2).one_way_collision = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.DOGMUSIC == true:
		$SkyIslands.queue_free()
		$Outskirts.queue_free()
		$UniCollapse.play()
		$ColorRect.show()
		$RichTextLabel.show()
		Modifier.DOGMUSIC = false
		$TextTimer.start()
	pass




func _on_body_entered(body):
	# Sets the object, that enters its area, to be at x and y 0.
	if body.name == "Player 1":
		Modifier.P1Alive = false
	elif body.name == "Player 2":
		Modifier.P2Alive = false
	elif body.name == "Player 3":
		Modifier.P3Alive = false
	elif body.name == "Player 4":
		Modifier.P4Alive = false
	elif body.name == "Player 5":
		Modifier.P5Alive = false
	body.queue_free()
	Modifier.playersleft -= 1
	pass # Replace with function body.


func _on_text_timer_timeout():
	$RichTextLabel.hide()
	pass # Replace with function body.



func _on_area_entered(area):
	area.queue_free()
