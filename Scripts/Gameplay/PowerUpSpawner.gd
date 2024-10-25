extends Node
@onready var Modifier = get_node("/root/Modifiers")
@export var Shield:PackedScene
@export var Spring:PackedScene
var power_minimum_time = 10
var power_maximum_time = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	#Sets the power up max and mix spawning times from the modifiers and start the timer
	power_minimum_time = Modifier.power_min_time
	power_maximum_time = Modifier.power_max_time
	$Timer.start(randf_range(power_minimum_time, power_maximum_time))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Power == false:
		pass
	else:
		pass


# On timeout, spawn a power-up and start the timer again
func _on_timer_timeout():
	if Modifier.Power == true:
		var Sh1 = Shield.instantiate()
		var Spr1 = Spring.instantiate()
		if randi_range(1,2) == 1:
			add_child(Sh1)
		else:
			add_child(Spr1)
		$Timer.start(randf_range(power_minimum_time, power_maximum_time))
