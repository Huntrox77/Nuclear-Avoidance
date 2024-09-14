extends Label
@onready var Modifier = get_node("/root/Modifiers")
@onready var timer = $Timer
var countdown = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.StartCountdown == true:
		timer.start()
		Modifier.StartCountdown = false
	pass


func _on_timer_timeout():
	if countdown >= 0:
		if countdown == 0:
			hide()
			Modifier.CountdownFinished = true
		else:
			text = str(countdown)
			countdown -= 1
			timer.start()
