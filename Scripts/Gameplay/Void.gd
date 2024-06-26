extends Area2D
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.hide()
	$RichTextLabel.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.DOGMUSIC == true:
		$UniCollapse.play()
		$ColorRect.show()
		$RichTextLabel.show()
		Modifier.DOGMUSIC = false
		$TextTimer.start()
	pass




func _on_body_entered(body):
	# Sets the object, that enters its area, to be at x and y 0.
	body.queue_free()
	Modifier.playersleft -= 1
	pass # Replace with function body.


func _on_text_timer_timeout():
	$RichTextLabel.hide()
	pass # Replace with function body.
