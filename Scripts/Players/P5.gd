extends Button
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.p5selection == true:
		button_pressed = true

func _on_pressed():
	Modifier.p5selection = not Modifier.p5selection
	if Modifier.p5selection == true:
		Modifier.playersleft += 1
	else:
		Modifier.playersleft -= 1
