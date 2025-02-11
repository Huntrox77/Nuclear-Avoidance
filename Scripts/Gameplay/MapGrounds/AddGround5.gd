extends Node
@export var Ground_Right:PackedScene
@onready var Besprite = null

# instantiates the ground scenes then adds them at the desired position
func _ready():
	var GR = Ground_Right.instantiate()
	var GR2 = Ground_Right.instantiate()
	var GR3 = Ground_Right.instantiate()
	var GR4 = Ground_Right.instantiate()
	var GR5 = Ground_Right.instantiate()
	var GR6 = Ground_Right.instantiate()
	var GR7 = Ground_Right.instantiate()
	var GR8 = Ground_Right.instantiate()
	var GR9 = Ground_Right.instantiate()
	var GR10 = Ground_Right.instantiate()
	var GR11 = Ground_Right.instantiate()
	var GR12 = Ground_Right.instantiate()
	var GR13 = Ground_Right.instantiate()
	var GR14 = Ground_Right.instantiate()
	
	#Top platform 1
	add_child(GR)
	GR.set_meta("PlayerOnly", true)
	GR.get_child(1).texture = Besprite
	GR.get_child(2).one_way_collision = true
	GR.position.x = 24
	GR.position.y += -290 + 64
	
	add_child(GR2)
	GR2.set_meta("PlayerOnly", true)
	GR2.get_child(1).texture = Besprite
	GR2.get_child(2).one_way_collision = true
	GR2.position.x = -40
	GR2.position.y += -290 + 64
	
	#Bottom platform 1
	add_child(GR3)
	GR3.position.x =  24
	GR3.position.y += 32
	
	add_child(GR4)
	GR4.position.x = -40
	GR4.position.y += 32
	
	#Top platform 2
	add_child(GR5)
	GR5.set_meta("PlayerOnly", true)
	GR5.get_child(1).texture = Besprite
	GR5.get_child(2).one_way_collision = true
	GR5.position.x = 344
	GR5.position.y += -226 + 64
	
	add_child(GR6)
	GR6.set_meta("PlayerOnly", true)
	GR6.get_child(1).texture = Besprite
	GR6.get_child(2).one_way_collision = true
	GR6.position.x = 280
	GR6.position.y += -226 + 64
	
	#Bottom platform 2
	add_child(GR7)
	GR7.position.x =  344
	GR7.position.y += -32
	
	add_child(GR8)
	GR8.position.x = 280
	GR8.position.y += -32
	
	#Top platform 3
	add_child(GR9)
	GR9.set_meta("PlayerOnly", true)
	GR9.get_child(1).texture = Besprite
	GR9.get_child(2).one_way_collision = true
	GR9.position.x = -344
	GR9.position.y += -226 + 64
	
	add_child(GR10)
	GR10.set_meta("PlayerOnly", true)
	GR10.get_child(1).texture = Besprite
	GR10.get_child(2).one_way_collision = true
	GR10.position.x = -280
	GR10.position.y += -226 + 64
	
	#Bottom platform 3
	add_child(GR11)
	GR11.position.x =  -344
	GR11.position.y += -32
	
	add_child(GR12)
	GR12.position.x = -280
	GR12.position.y += -32
	
	#other platforms
	add_child(GR13)
	GR13.position.x = -216 - 312
	GR13.position.y += -96
	
	add_child(GR14)
	GR14.position.x = 408 + 128
	GR14.position.y += -96
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
