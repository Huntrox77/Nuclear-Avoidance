extends Control
@onready var Modifier = get_node("/root/Modifiers")
var AdvMod = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Modifier.AdvMod = AdvMod
	pass


func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		AdvMod = true
	else:
		AdvMod = false
	pass # Replace with function body.
