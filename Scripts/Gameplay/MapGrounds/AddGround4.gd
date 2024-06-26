extends Node
@export var GroundLeft:PackedScene
@export var Ground:PackedScene
@export var GroundRight:PackedScene

var movespeed = 1
var movespeed2 = 0.66
var movespeed3 = 1.33
var trueGR2 = GroundRight
var trueGL2 = GroundLeft
var trueG2 = Ground
var trueGR = GroundRight
var trueGL = GroundLeft
var trueG = Ground
var trueGR3 = GroundRight
var trueGL3 = GroundLeft
var trueG3 = Ground
# Called when the node enters the scene tree for the first time.
func _ready():
	var GL = GroundLeft.instantiate()
	var GL2 = GroundLeft.instantiate()
	var GL3 = GroundLeft.instantiate()
	var G = Ground.instantiate()
	var G2 = Ground.instantiate()
	var GR = GroundRight.instantiate()
	var GR2 = GroundRight.instantiate()
	var GR3 = GroundRight.instantiate()
	
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
	
	trueGR2 = GR2
	trueGL2 = GL2
	trueG2 = G2
	trueGR = GR
	trueGL = GL
	trueG = G
	trueGR3 = GR3
	trueGL3 = GL3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	trueGL2.position.y -= movespeed
	trueG2.position.y -= movespeed
	trueGR2.position.y -= movespeed
	trueGL.position.y -= movespeed2
	trueG.position.y -= movespeed2
	trueGR.position.y -= movespeed2
	trueGL3.position.y -= movespeed3
	trueGR3.position.y -= movespeed3
	pass


func _on_timer_timeout():
	if movespeed == -1:
		movespeed = 1
	else:
		movespeed = -1
	pass # Replace with function body.


func _on_timer_2_timeout():
	if movespeed2 == -0.66:
		movespeed2 = 0.66
	else:
		movespeed2 = -0.66
	pass # Replace with function body.


func _on_timer_3_timeout():
	if movespeed3 == -1.33:
		movespeed3 = 1.33
	else:
		movespeed3 = -1.33
	pass # Replace with function body.
