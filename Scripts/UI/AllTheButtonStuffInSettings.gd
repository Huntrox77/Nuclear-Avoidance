extends Control
@onready var Modifier = get_node("/root/Modifiers")
@onready var GlobalText = get_node("/root/GlobalTexts")
var AdvMod = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Modifier.AdvMod = AdvMod
	$OptionButton.selected = GlobalText.KeepChoice
	pass


func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		AdvMod = true
	else:
		AdvMod = false
	pass # Replace with function body.


func _on_option_button_item_selected(index):
	if index == 0:
		GlobalText.textspeed = 0.03
		GlobalText.KeepChoice = 0
	if index == 1:
		GlobalText.textspeed = 0.02
		GlobalText.KeepChoice = 1
	if index == 2:
		GlobalText.textspeed = 0.01
		GlobalText.KeepChoice = 2
