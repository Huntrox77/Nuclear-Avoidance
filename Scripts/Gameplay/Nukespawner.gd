extends Node2D

@export var nuke_scene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	var k = nuke_scene.instantiate()
	add_child(k)
	pass
