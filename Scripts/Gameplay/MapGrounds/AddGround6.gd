extends Node
@export var GroundLeft:PackedScene
@export var GroundRight:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var GR = GroundRight.instantiate()
	var GR2 = GroundLeft.instantiate()
	var GR3 = GroundRight.instantiate()
	var GR4 = GroundLeft.instantiate()
	var GR5 = GroundLeft.instantiate()
	var GR6 = GroundRight.instantiate()
	
	#Bottom platform 1
	add_child(GR)
	GR.position.x =  24
	GR.position.y += 32
	
	add_child(GR2)
	GR2.position.x = -40
	GR2.position.y += 32
	
	#Bottom platform 2
	add_child(GR3)
	GR3.position.x =  344
	GR3.position.y += 32
	
	add_child(GR4)
	GR4.position.x = 280
	GR4.position.y += 32
	
	#Bottom platform 3
	add_child(GR5)
	GR5.position.x =  -344
	GR5.position.y += 32
	
	add_child(GR6)
	GR6.position.x = -280
	GR6.position.y += 32


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
