extends Control
@onready var Modifier = get_node("/root/Modifiers")
@onready var P1Button = get_node("P1")
@onready var P2Button = get_node("P2")
@onready var P3Button = get_node("P3")
@onready var P4Button = get_node("P4")
@onready var AdvModBut = $AdvMod

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.p1selection == true:
		P1Button.button_pressed = true
	if Modifier.AdvMod == false:
		AdvModBut.hide()
	else:
		AdvModBut.show()
	if Modifier.p2selection == true:
		P2Button.button_pressed = true
	if Modifier.p3selection == true:
		P3Button.button_pressed = true
	if Modifier.p4selection == true:
		P4Button.button_pressed = true


func _on_p_1_pressed():
	Modifier.p1selection = not Modifier.p1selection
	if Modifier.p1selection == true:
		Modifier.playersleft += 1
	else:
		Modifier.playersleft -= 1


func _on_p_2_pressed():
	Modifier.p2selection = not Modifier.p2selection
	if Modifier.p2selection == true:
		Modifier.playersleft += 1
	else:
		Modifier.playersleft -= 1


func _on_p_3_pressed():
	Modifier.p3selection = not Modifier.p3selection
	if Modifier.p3selection == true:
		Modifier.playersleft += 1
	else:
		Modifier.playersleft -= 1


func _on_p_4_pressed():
	Modifier.p4selection = not Modifier.p4selection
	if Modifier.p4selection == true:
		Modifier.playersleft += 1
	else:
		Modifier.playersleft -= 1


func _on_smash_bros_button_pressed():
	Modifier.Smashbros = not Modifier.Smashbros
	pass # Replace with function body.


func _on_impaction_pressed():
	Modifier.Impaction = not Modifier.Impaction
	pass # Replace with function body.


func _on_blackout_button_pressed():
	Modifier.Blackout = not Modifier.Blackout
	pass # Replace with function body.


func _on_crumble_pressed():
	Modifier.Crumble = not Modifier.Crumble
	pass # Replace with function body.


func _on_map_4_toggled(_toggled_on):
	Modifier.map4 = not Modifier.map4


func _on_map_5_toggled(_toggled_on):
	Modifier.map5 = not Modifier.map5


func _on_map_3_toggled(_toggled_on):
	Modifier.map3 = not Modifier.map3


func _on_map_2_toggled(_toggled_on):
	Modifier.map2 = not Modifier.map2


func _on_map_1_toggled(_toggled_on):
	Modifier.map1 = not Modifier.map1


func _on_sweeper_pressed():
	Modifier.Sweeper = not Modifier.Sweeper


func _on_ice_pressed():
	Modifier.Ice = not Modifier.Ice
	pass # Replace with function body.


func _on_fog_pressed():
	Modifier.Fog = not Modifier.Fog
	pass # Replace with function body.


func _on_adv_mod_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Advanced Modifiers.tscn")
	pass # Replace with function body.
