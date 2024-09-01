extends HSlider
@onready var Modifier = get_node("/root/Modifiers")
@onready var Per = $Percentage
# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "DMNSC":
		value = Modifier.DMNSC
	if name == "Gravity":
		value = Modifier.GravityMult


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if name == "DMNSC":
		var valueamount = value * 100 / 4
		Modifier.DMNSC = value
		Per.text = str(valueamount) + "% of the normal amount"
	if name == "Gravity":
		var valueamount = value
		Modifier.GravityMult = value
		Per.text = str(valueamount) + "%"
