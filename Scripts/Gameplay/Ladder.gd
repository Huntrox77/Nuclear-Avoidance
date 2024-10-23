extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Sets player metadata to have "ladder" if in the ladder area
func _on_body_entered(body):
	if body.has_meta("Player"):
		body.set_meta("Ladder", true)


# Removes player metadata "ladder" if left the ladder area
func _on_body_exited(body):
	if body.has_meta("Player"):
		body.remove_meta("Ladder")
