extends Label
@onready var Modifier = get_node("/root/Modifiers")
@onready var timer = $Timer
var countdown = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	pass # Replace with function body.


# Starts counting... down surprisingly
func _process(_delta):
	if Modifier.Start_Countdown == true:
		timer.start()
		Modifier.Start_Countdown = false
	pass

# Countdown Ends and tells the game
func _on_timer_timeout():
	if countdown >= 0:
		if countdown == 0:
			hide()
			Modifier.Countdown_Finished = true
		else:
			text = str(countdown)
			countdown -= 1
			timer.start()
