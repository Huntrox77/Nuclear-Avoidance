extends HSlider
@onready var Modifier = get_node("/root/Modifiers")
@onready var Per = $Percentage
# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "DMNSC":
		value = Modifier.DMNSC
	if name == "Gravity":
		value = Modifier.GravityMult
	if name == "Speed":
		value = Modifier.PSpeed
	if name == "Power Min Time":
		value = Modifier.powermintime
	if name == "Power Max Time":
		value = Modifier.powermaxtime


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
	if name == "Speed":
		var valueamount = value
		Modifier.PSpeed = value
		Per.text = str(valueamount) + "%"
	if name == "Power Min Time":
		var valueamount = value
		Modifier.powermintime = value
		Per.text = str(valueamount) + "s"
	if name == "Power Max Time":
		var valueamount = value
		Modifier.powermaxtime = value
		Per.text = str(valueamount) + "s"
