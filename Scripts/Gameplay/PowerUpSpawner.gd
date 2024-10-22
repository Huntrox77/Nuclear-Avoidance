extends Node
@onready var Modifier = get_node("/root/Modifiers")
@export var Shield:PackedScene
@export var Spring:PackedScene
var powerminimumtime = 10
var powermaximumtime = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	#FIX
	powerminimumtime = Modifier.powermintime
	powermaximumtime = Modifier.powermaxtime
	$Timer.start(randf_range(powerminimumtime, powermaximumtime))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Power == false:
		pass
	else:
		pass


func _on_timer_timeout():
	if Modifier.Power == true:
		var Sh1 = Shield.instantiate()
		var Spr1 = Spring.instantiate()
		if randi_range(1,2) == 1:
			add_child(Sh1)
		else:
			add_child(Spr1)
		$Timer.start(randf_range(powerminimumtime, powermaximumtime))
