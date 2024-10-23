extends Node2D

@onready var Modifier = get_node("/root/Modifiers")

@export var blackout:PackedScene
@export var fog:PackedScene
@export var Cloud:PackedScene

# instantiates the fog and adds it
func _ready():
	if Modifier.Fog == true:
		var k = fog.instantiate()
		add_child(k)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# after 10 seconds, if the blackout modifier is on then add the blackout
func _on_timer_timeout():
	if Modifier.Blackout == true:
		var k = blackout.instantiate()
		add_child(k)
	pass

# instantiates the clouds and adds it
func _on_cloud_timer_timeout():
	var C = Cloud.instantiate()
	add_child(C)
	
