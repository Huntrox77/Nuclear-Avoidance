extends Area2D
@onready var Modifier = get_node("/root/Modifiers")
var Players = null
# Called when the node enters the scene tree for the first time.
func _ready():
	Players = get_parent().get_child(2).get_children()
	$ColorRect.hide()
	$RichTextLabel.hide()
	if Modifier.Collide == true:
		for i in Players:
			i.get_child(0).one_way_collision = false
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



func _on_area_entered(area):
	area.queue_free()
