extends Node
@export var GroundLeft:PackedScene
@export var Ground:PackedScene
@export var GroundRight:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var GL = GroundLeft.instantiate()
	var GR = GroundRight.instantiate()
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
