extends Button
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Keep Player 5 on inbetween games
func _process(_delta):
	if Modifier.p5_selection == true:
		button_pressed = true


# Toggle player 5 on and / or off
func _on_pressed():
	Modifier.p5_selection = not Modifier.p5_selection
	if Modifier.p5_selection == true:
		Modifier.players_left += 1
	else:
		Modifier.players_left -= 1
