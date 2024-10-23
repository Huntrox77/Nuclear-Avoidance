extends Node
@export var Ground_Left:PackedScene
@export var Ground:PackedScene
@export var Ground_Right:PackedScene

# instantiates the ground scenes then adds them at the desired position
func _ready():
	var GL = Ground_Left.instantiate()
	var GR = Ground_Right.instantiate()
	var G = Ground.instantiate()

	add_child(GR)
	GR.position.x = 64
	GR.position.y = -320
	add_child(G)
	G.position.x = 0
	G.position.y = -320
	add_child(GL)
	GL.position.x = -64
	GL.position.y = -320
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
