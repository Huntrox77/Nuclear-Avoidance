extends Node2D

@export var nuke_scene:PackedScene
@export var nuke_scene2:PackedScene
@export var nuke_scene3:PackedScene
var nuke2 = false
var nuke3 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	var k = nuke_scene.instantiate()
	var k2 = nuke_scene2.instantiate()
	var k3 = nuke_scene3.instantiate()
	add_child(k)
	if nuke2 == true:
		add_child(k2)
		print("2")
	if nuke3 == true:
		add_child(k3)
		print("3")
	pass


func _on_timer_2_timeout():
	nuke2 = true
	pass # Replace with function body.


func _on_timer_3_timeout():
	nuke3 = true
	pass # Replace with function body.
