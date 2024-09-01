extends CheckButton
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "Sweeper":
		if Modifier.Sweeper == true:
			button_pressed = true
	if Modifier.Clam == true:
		text = "DOG"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Clam == true:
		text = "DOG"
	if Modifier.Clam == false:
		text = "Sweeper"
