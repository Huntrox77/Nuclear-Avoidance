extends CheckButton
@onready var Modifier = get_node("/root/Modifiers")


# Keeps modifer UI's on through scene switch
func _ready():
	if name == "Blackout":
		if Modifier.Blackout == true:
			button_pressed = true
	if name == "Smash_bros":
		if Modifier.Smash_bros == true:
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
	if name == "Collide":
		if Modifier.Collide == true:
			button_pressed = true
	if name == "HomingBombs":
		if Modifier.Follow == true:
			button_pressed = true
	if name == "Reverse":
		if Modifier.Reverse == true:
			button_pressed = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
