extends RichTextLabel
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Clam == false:
		if (
				Input.is_key_pressed(KEY_C) 
				and Input.is_key_pressed(KEY_L) 
				and Input.is_key_pressed(KEY_A) 
				and Input.is_key_pressed(KEY_M)
		):
			show()
			Modifier.Clam = true
	elif (
			Input.is_key_pressed(KEY_N) 
			and Input.is_key_pressed(KEY_O) 
			and Input.is_key_pressed(KEY_R) 
			and Input.is_key_pressed(KEY_M)
	):
			hide()
			Modifier.Clam = false
