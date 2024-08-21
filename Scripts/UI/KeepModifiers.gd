extends CheckButton
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "Blackout":
		if Modifier.Blackout == true:
			button_pressed = true
	if name == "SmashBros":
		if Modifier.Smashbros == true:
			button_pressed = true
	if name == "Impaction":
		if Modifier.Impaction == true:
			button_pressed = true
	if name == "Crumble":
		if Modifier.Crumble == true:
			button_pressed = true
	if name == "Ice":
		if Modifier.Ice == true:
			button_pressed = true
	if name == "Fog":
		if Modifier.Fog == true:
			button_pressed = true
	if name == "Power":
		if Modifier.Power == true:
			button_pressed = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(Modifier.Power)
	pass
