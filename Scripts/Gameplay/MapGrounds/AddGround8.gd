extends Node
@export var GroundLeft:PackedScene
@export var Ground:PackedScene
@export var GroundRight:PackedScene
@onready var Besprite = null
var G3 = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var GL = GroundLeft.instantiate()
	var GR = GroundRight.instantiate()
	var G = Ground.instantiate()
	var GL2 = GroundLeft.instantiate()
	var GR2 = GroundRight.instantiate()
	var G2 = Ground.instantiate()
	var GL3 = GroundLeft.instantiate()
	var GR3 = GroundRight.instantiate()
	G3 = Ground.instantiate()

	add_child(GR)
	GR.position.x = 64
	GR.position.y = -320
	GR.set_meta("PlayerOnly", true)
	GR.get_child(1).texture = Besprite
	GR.get_child(2).one_way_collision = true
	add_child(G)
	G.position.x = 0
	G.position.y = -320
	G.set_meta("PlayerOnly", true)
	G.get_child(1).texture = Besprite
	G.get_child(2).one_way_collision = true
	add_child(GL)
	GL.position.x = -64
	GL.position.y = -320
	GL.set_meta("PlayerOnly", true)
	GL.get_child(1).texture = Besprite
	GL.get_child(2).one_way_collision = true
	
	add_child(GR2)
	GR2.scale.y = -1
	GR2.position.x = 372
	GR2.position.y = -320
	GR2.set_meta("PlayerOnly", true)
	GR2.get_child(1).texture = Besprite
	GR2.get_child(2).one_way_collision = true
	add_child(G2)
	G2.scale.y = -1
	G2.position.x = 436
	G2.position.y = -320
	G2.set_meta("PlayerOnly", true)
	G2.get_child(1).texture = Besprite
	G2.get_child(2).one_way_collision = true
	add_child(GL2)
	GL2.scale.y = -1
	GL2.position.x = 500
	GL2.position.y = -320
	GL2.set_meta("PlayerOnly", true)
	GL2.get_child(1).texture = Besprite
	GL2.get_child(2).one_way_collision = true
	
	add_child(GR3)
	GR3.scale.y = -1
	GR3.position.x = -372
	GR3.position.y = -320
	GR3.set_meta("PlayerOnly", true)
	GR3.get_child(1).texture = Besprite
	GR3.get_child(2).one_way_collision = true
	add_child(G3)
	G3.scale.y = -1
	G3.position.x = -436
	G3.position.y = -320
	G3.set_meta("PlayerOnly", true)
	G3.get_child(1).texture = Besprite
	G3.get_child(2).one_way_collision = true
	add_child(GL3)
	GL3.scale.y = -1
	GL3.position.x = -500
	GL3.position.y = -320
	GL3.set_meta("PlayerOnly", true)
	GL3.get_child(1).texture = Besprite
	GL3.get_child(2).one_way_collision = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
