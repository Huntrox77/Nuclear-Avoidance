extends Node2D

@onready var Modifier = get_node("/root/Modifiers")
@export var nuke_scene:PackedScene
@export var sweeper_scene:PackedScene
@onready var Swimer = $Swimer

# if challenges is on please spawn nuke 2 and 3 also 
func _ready():
	if Modifier.Challenge_Or_Local == "Challenge":
		Modifier.Nuke2 = true
		Modifier.Nuke3 = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# A bunch of timer stuff to tell the game when to start spawning the next bomb
func _on_timer_timeout():
	var k = nuke_scene.instantiate()
	add_child(k)
	pass


func _on_timer_2_timeout():
	Modifier.Nuke2 = true
	pass # Replace with function body.


func _on_timer_3_timeout():
	Modifier.Nuke3 = true
	pass # Replace with function body.


func _on_timer_4_timeout():
	Modifier.Nuke4 = true
	pass # Replace with function body.


func _on_swimer_timeout():
	if Modifier.Sweeper == true:
		var s = sweeper_scene.instantiate()
		add_child(s)
		Swimer.start(randf_range(9.33, 15.66))


func _on_swimer_timer_timeout():
	Swimer.start(randf_range(3.33, 9.99))
	pass # Replace with function body.
