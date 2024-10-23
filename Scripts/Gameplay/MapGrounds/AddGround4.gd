extends Node
@export var Ground_Left:PackedScene
@export var Ground:PackedScene
@export var Ground_Right:PackedScene

var move_speed = 1
var move_speed2 = 0.66
var move_speed3 = 1.33
var true_GR2 = Ground_Right
var true_GL2 = Ground_Left
var true_G2 = Ground
var true_GR = Ground_Right
var true_GL = Ground_Left
var true_G = Ground
var true_GR3 = Ground_Right
var true_GL3 = Ground_Left
var true_G3 = Ground

# instantiates the ground scenes then adds them at the desired position
func _ready():
	var GL = Ground_Left.instantiate()
	var GL2 = Ground_Left.instantiate()
	var GL3 = Ground_Left.instantiate()
	var G = Ground.instantiate()
	var G2 = Ground.instantiate()
	var GR = Ground_Right.instantiate()
	var GR2 = Ground_Right.instantiate()
	var GR3 = Ground_Right.instantiate()
	
	add_child(GL)
	GL.position.x = -480
	add_child(G)
	G.position.x = -416
	add_child(GR)
	GR.position.x = -352
	
	add_child(GL2)
	GL2.position.x = 352
	add_child(G2)
	G2.position.x = 416
	add_child(GR2)
	GR2.position.x = 480
	
	add_child(GR3)
	GR3.position.x = 32
	add_child(GL3)
	GL3.position.x = -32
	
	true_GR2 = GR2
	true_GL2 = GL2
	true_G2 = G2
	true_GR = GR
	true_GL = GL
	true_G = G
	true_GR3 = GR3
	true_GL3 = GL3
	pass # Replace with function body.


# Moves Moving Platforms
func _process(_delta):
	true_GL2.position.y -= move_speed
	true_G2.position.y -= move_speed
	true_GR2.position.y -= move_speed
	true_GL.position.y -= move_speed2
	true_G.position.y -= move_speed2
	true_GR.position.y -= move_speed2
	true_GL3.position.y -= move_speed3
	true_GR3.position.y -= move_speed3
	pass

# Changes Direction
func _on_timer_timeout():
	if move_speed == -1:
		move_speed = 1
	else:
		move_speed = -1
	pass # Replace with function body.


func _on_timer_2_timeout():
	if move_speed2 == -0.66:
		move_speed2 = 0.66
	else:
		move_speed2 = -0.66
	pass # Replace with function body.


func _on_timer_3_timeout():
	if move_speed3 == -1.33:
		move_speed3 = 1.33
	else:
		move_speed3 = -1.33
	pass # Replace with function body.
