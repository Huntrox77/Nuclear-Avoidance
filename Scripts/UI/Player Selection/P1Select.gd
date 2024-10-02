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
	#Players
	if Modifier.p1selection == true:
		P1Button.button_pressed = true
	if Modifier.p2selection == true:
		P2Button.button_pressed = true
	if Modifier.p3selection == true:
		P3Button.button_pressed = true
	if Modifier.p4selection == true:
		P4Button.button_pressed = true
	#Maps
	if Modifier.loop == true:
		$"Loop Button".button_pressed = true
	if Modifier.map1 == true:
		$"Map Container/HBoxContainer/Map1".button_pressed = true
	if Modifier.map2 == true:
		$"Map Container/HBoxContainer/Map2".button_pressed = true
	if Modifier.map3 == true:
		$"Map Container/HBoxContainer/Map3".button_pressed = true
	if Modifier.map4 == true:
		$"Map Container/HBoxContainer/Map4".button_pressed = true
	if Modifier.map5 == true:
		$"Map Container/HBoxContainer/Map5".button_pressed = true
	if Modifier.map6 == true:
		$"Map Container/HBoxContainer/Map6".button_pressed = true
	if Modifier.map7 == true:
		$"Map Container/HBoxContainer/Map7".button_pressed = true
	if Modifier.map8 == true:
		$"Map Container/HBoxContainer/Map8".button_pressed = true
	if Modifier.map9 == true:
		$"Map Container/HBoxContainer/Map9".button_pressed = true

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


func _on_sweeper_pressed():
	Modifier.Sweeper = not Modifier.Sweeper


func _on_ice_pressed():
	Modifier.Ice = not Modifier.Ice
	if Modifier.PSpeed == 200:
		Modifier.PSpeed = 100
	elif Modifier.PSpeed == 100:
		Modifier.PSpeed = 200


func _on_fog_pressed():
	Modifier.Fog = not Modifier.Fog
	pass # Replace with function body.


func _on_power_pressed():
	Modifier.Power = not Modifier.Power
	pass # Replace with function body.


func _on_collide_pressed():
	Modifier.Collide = not Modifier.Collide


func _on_homing_bombs_pressed():
	Modifier.Follow = not Modifier.Follow


func _on_adv_mod_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Advanced Modifiers.tscn")
	pass # Replace with function body.


func _on_loop_button_pressed():
	Modifier.loop = not Modifier.loop


func _on_map_1_pressed():
	Modifier.map1 = not Modifier.map1


func _on_map_2_pressed():
	Modifier.map2 = not Modifier.map2


func _on_map_3_pressed():
	Modifier.map3 = not Modifier.map3


func _on_map_4_pressed():
	Modifier.map4 = not Modifier.map4


func _on_map_5_pressed():
	Modifier.map5 = not Modifier.map5


func _on_map_6_pressed():
	Modifier.map6 = not Modifier.map6


func _on_map_7_pressed():
	Modifier.map7 = not Modifier.map7


func _on_map_8_pressed():
	Modifier.map8 = not Modifier.map8


func _on_map_9_pressed():
	Modifier.map9 = not Modifier.map9
