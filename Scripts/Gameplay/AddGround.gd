extends Node
@export var GroundLeft:PackedScene
@export var Ground:PackedScene
@export var GroundRight:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var GL = GroundLeft.instantiate()
	var G = Ground.instantiate()
	var G2 = Ground.instantiate()
	var G3 = Ground.instantiate()
	var G4 = Ground.instantiate()
	var G5 = Ground.instantiate()
	var G6 = Ground.instantiate()
	var GR = GroundRight.instantiate()
	add_child(GL)
	add_child(G)
	add_child(G2)
	G2.position.x += 64
	add_child(G3)
	G3.position.x += 128
	add_child(G4)
	G4.position.x += 192
	add_child(G5)
	G5.position.x += 256
	add_child(G6)
	G6.position.x += 256 + 64
	add_child(GR)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
