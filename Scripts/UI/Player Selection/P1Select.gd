extends Control
@onready var Modifier = get_node("/root/Modifiers")
@onready var P1Button = get_node("P1")
@onready var P2Button = get_node("P2")
@onready var P3Button = get_node("P3")
@onready var P4Button = get_node("P4")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.p1selection == true:
		P1Button.button_pressed = true
	if Modifier.p2selection == true:
		P2Button.button_pressed = true
	if Modifier.p3selection == true:
		P3Button.button_pressed = true
	if Modifier.p4selection == true:
		P4Button.button_pressed = true


func _on_p_1_pressed():
	Modifier.p1selection = not Modifier.p1selection
	print(	Modifier.p1selection)


func _on_p_2_pressed():
	Modifier.p2selection = not Modifier.p2selection


func _on_p_3_pressed():
	Modifier.p3selection = not Modifier.p3selection


func _on_p_4_pressed():
	Modifier.p4selection = not Modifier.p4selection


func _on_smash_bros_button_pressed():
	Modifier.Smashbros = not Modifier.Smashbros
	pass # Replace with function body.


func _on_blackout_button_pressed():
	Modifier.Blackout = not Modifier.Blackout
	pass # Replace with function body.
