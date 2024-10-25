extends HSlider
@onready var Modifier = get_node("/root/Modifiers")
@onready var Per = $Percentage


# Prepares the sliders 
func _ready():
	if name == "DMNSC":
		value = Modifier.DMNSC
	if name == "Gravity":
		value = Modifier.Gravity_Mult
	if name == "Speed":
		value = Modifier.P_Speed
	if name == "Power Min Time":
		value = Modifier.power_min_time
	if name == "Power Max Time":
		value = Modifier.power_max_time


# sets sliders to represent the values.
func _process(_delta):
	if name == "DMNSC":
		var value_amount = value * 100 / 4
		Modifier.DMNSC = value
		Per.text = str(value_amount) + "% of the normal amount"
	if name == "Gravity":
		var value_amount = value
		Modifier.Gravity_Mult = value
		Per.text = str(value_amount) + "%"
	if name == "Speed":
		var value_amount = value
		Modifier.P_Speed = value
		Per.text = str(value_amount) + "%"
	if name == "Power Min Time":
		var value_amount = value
		Modifier.power_min_time = value
		Per.text = str(value_amount) + "s"
	if name == "Power Max Time":
		var value_amount = value
		Modifier.power_max_time = value
		Per.text = str(value_amount) + "s"
