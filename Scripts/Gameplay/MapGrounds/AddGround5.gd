extends Node
@export var GroundRight:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var GR = GroundRight.instantiate()
	var GR2 = GroundRight.instantiate()
	var GR3 = GroundRight.instantiate()
	var GR4 = GroundRight.instantiate()
	var GR5 = GroundRight.instantiate()
	var GR6 = GroundRight.instantiate()
	var GR7 = GroundRight.instantiate()
	
	
	add_child(GR)
	GR.position.x = -480 + 64
	

	add_child(GR2)
	GR2.position.x = -480 + 64
	GR2.position.y += -128
	
	add_child(GR3)
	GR3.position.x = -480 + 64
	GR3.position.y += -192
	
	add_child(GR4)
	GR4.position.x = -480 + 64
	GR4.position.y += -256
	
	add_child(GR5)
	GR5.position.x = -480 + 64
	GR5.position.y += -256 + 64
	
	add_child(GR6)
	GR6.position.x = -480 + 64
	GR6.position.y += -256 + 128
	
	add_child(GR7)
	GR7.position.x = -480 + 64
	GR.position.y += -256 + 192
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
