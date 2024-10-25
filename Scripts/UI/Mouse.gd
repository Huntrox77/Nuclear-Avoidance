extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# sets the funny explode mouse thing to mouse pos
func _process(_delta):
	global_position = get_global_mouse_position()
	pass
