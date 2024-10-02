extends Node
@export var Ground:PackedScene
@onready var Besprite = null
var Movingdirection = true
var MovingPlatChildren = null
var G9 = null
var G10 = null
var G11 = null
var movespeed = -0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	MovingPlatChildren = get_parent().get_child(9).get_child(3).get_children()
	var G = Ground.instantiate()
	var G2 = Ground.instantiate()
	var G3 = Ground.instantiate()
	var G4 = Ground.instantiate()
	var G5 = Ground.instantiate()
	var G6 = Ground.instantiate()
	var G7 = Ground.instantiate()
	var G8 = Ground.instantiate()
	G9 = Ground.instantiate()
	G10 = Ground.instantiate()
	G11 = Ground.instantiate()
	
	# Middle Platform
	add_child(G)
	G.set_meta("PlayerOnly", true)
	G.get_child(1).texture = Besprite
	G.get_child(2).one_way_collision = true
	G.position.x = 88
	G.position.y = -124
	add_child(G2)
	G2.set_meta("PlayerOnly", true)
	G2.get_child(1).texture = Besprite
	G2.get_child(2).one_way_collision = true
	G2.position.x = 152
	G2.position.y = -124
	# Right Platform
	add_child(G3)
	G3.set_meta("PlayerOnly", true)
	G3.get_child(1).texture = Besprite
	G3.get_child(2).one_way_collision = true
	G3.position.x = 397
	G3.position.y = -124
	add_child(G4)
	G4.set_meta("PlayerOnly", true)
	G4.get_child(1).texture = Besprite
	G4.get_child(2).one_way_collision = true
	G4.position.x = 429
	G4.position.y = -124
	add_child(G5)
	G5.set_meta("PlayerOnly", true)
	G5.get_child(1).texture = Besprite
	G5.get_child(2).one_way_collision = true
	G5.position.x = 493
	G5.position.y = -124
	# Left Platform
	add_child(G6)
	G6.set_meta("PlayerOnly", true)
	G6.get_child(1).texture = Besprite
	G6.get_child(2).one_way_collision = true
	G6.position.x = -501
	G6.position.y = -124
	add_child(G7)
	G7.set_meta("PlayerOnly", true)
	G7.get_child(1).texture = Besprite
	G7.get_child(2).one_way_collision = true
	G7.position.x = -437
	G7.position.y = -124
	add_child(G8)
	G8.set_meta("PlayerOnly", true)
	G8.get_child(1).texture = Besprite
	G8.get_child(2).one_way_collision = true
	G8.position.x = -373
	G8.position.y = -124
	# Moving Platform
	add_child(G9)
	G9.get_child(0).color = Color(0.329, 0.329, 0.329)
	G9.get_child(1).texture = Besprite
	G9.position.x = -212
	G9.position.y = -167
	add_child(G10)
	G10.get_child(0).color = Color(0.329, 0.329, 0.329)
	G10.get_child(1).texture = Besprite
	G10.position.x = -148
	G10.position.y = -167
	add_child(G11)
	G11.get_child(0).color = Color(0.329, 0.329, 0.329)
	G11.get_child(1).texture = Besprite
	G11.position.x = -84
	G11.position.y = -167

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Movingdirection == true:
		for i in MovingPlatChildren:
			i.position.y += movespeed
		G9.position.y += movespeed
		G10.position.y += movespeed
		G11.position.y += movespeed
	else:
		for i in MovingPlatChildren:
			i.position.y -= movespeed
		G9.position.y -= movespeed
		G10.position.y -= movespeed
		G11.position.y -= movespeed


func _on_moving_thing_timer_timeout():
	Movingdirection = not Movingdirection
