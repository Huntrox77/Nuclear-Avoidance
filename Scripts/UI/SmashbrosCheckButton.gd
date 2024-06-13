extends CheckButton
# Access the modifiers script
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	Modifier.Smashbros = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Turn blackout on or off
func _on_toggled(toggled_on):
	if toggled_on == true:
		Modifier.Smashbros = true
	else:
		Modifier.Smashbros = false
	pass # Replace with function body.
