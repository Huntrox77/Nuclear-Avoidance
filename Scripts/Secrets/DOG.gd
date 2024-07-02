extends CheckButton
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "Sweeper":
		if Modifier.Sweeper == true:
			button_pressed = true
	if Modifier.DOG == true:
		text = "DOG"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_key_pressed(KEY_D) and Input.is_key_pressed(KEY_O) and Input.is_key_pressed(KEY_G):
		text = "DOG"
		Modifier.DOG = true
	if Input.is_key_pressed(KEY_S) and Input.is_key_pressed(KEY_W) and Input.is_key_pressed(KEY_P):
		text = "Sweeper"
		Modifier.DOG = false
	pass
