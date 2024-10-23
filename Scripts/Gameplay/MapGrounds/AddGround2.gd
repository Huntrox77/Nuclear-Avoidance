extends Node
@export var Ground_Left:PackedScene
@export var Ground:PackedScene
@export var Ground_Right:PackedScene

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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
