extends Button
@onready var Global_Text = get_node("/root/GlobalTexts")
@onready var Modifier = get_node("/root/Modifiers")
var parent_child = get_parent()
var panel = get_parent()
var Settings_Size = false
var Achieve_Size = false
var Challenge_Size = false
var Play_Size = false
var Credit_Size = false
var Credit_Size_Back = false
var Tutorial_Size = false
var Tutorial_Size_Back = false

# Sets up the variables but like more
func _ready():
	panel = get_parent().get_child(8)
	parent_child = get_parent().get_children()
	if panel.get_child(0) is Container:
		panel.get_child(0).get_child(0).position.y = 660


# makes the background UI element move the funny way and look neat before sending the player to the scene requested
func _process(_delta):
	if panel.get_child(0) is Container:
		if Global_Text.text_speed == 1:
			panel.get_child(0).get_child(0).position.y -= 1
		if Global_Text.text_speed == 0.03:
			panel.get_child(0).get_child(0).position.y -= 0.66
		if Global_Text.text_speed == 0.02:
			panel.get_child(0).get_child(0).position.y -= 0.33
		if Global_Text.text_speed == 0.01:
			panel.get_child(0).get_child(0).position.y -= 0.25
	if panel.size.x >= 1105:
		if Achieve_Size == true:
			Achieve_Size = false
			get_tree().change_scene_to_file("res://Scenes/Menus/achievements.tscn")
		elif Settings_Size == true:
			Settings_Size = false
			get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")
		elif Challenge_Size == true:
			get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
		elif Play_Size == true:
			get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
	elif (Settings_Size 
			or Achieve_Size 
			or Challenge_Size 
			or Play_Size == true
	):
		panel.size.x += 10
		panel.position.x += 0.3
		panel.size.y -= 0.33
		panel.position.y += 0.2
		panel.get_child(0).scale.x += 0.1
		panel.get_child(0).scale.y -= 0.0033
	elif Credit_Size == true:
		panel.position.x += 5
		if panel.position.x >= 365:
			Modifier.current_map = "credits"
			get_tree().change_scene_to_file("res://Scenes/Menus/Credits.tscn")
	elif Credit_Size_Back == true:
		panel.position.x -= 5
		if panel.position.x <= 0:
			Modifier.current_map = "menu"
			get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")
	elif Tutorial_Size == true:
		panel.position.x += 5
		panel.size.y -= 4
		panel.position.y += 2
		if panel.position.x >= 365:
			Modifier.current_map = "credits"
			get_tree().change_scene_to_file("res://Scenes/Menus/Tutorial.tscn")
	elif Tutorial_Size_Back == true:
		panel.position.x -= 5
		panel.size.y += 4
		panel.position.y -= 2
		if panel.position.x <= 0:
			Modifier.current_map = "menu"
			get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")



# Sets off the triggers in the _delta() function
func _on_pressed():
	# Code to change the scene to the game.
	if name == "EndCredits":
		for i in get_parent().get_children():
			i.hide()
			if i == panel:
				i.show()
		Credit_Size_Back = true
	elif name == "EndTutorial":
		for i in get_parent().get_children():
			i.hide()
			if i == panel:
				i.show()
		Tutorial_Size_Back = true
	else:
		get_tree().quit()
	pass # Replace with function body.


# Sets off the triggers in the _delta() function
func _on_settings_pressed():
	for i in parent_child:
		i.hide()
		if i == panel:
			i.show()
	Settings_Size = true


# Sets off the triggers in the _delta() function
func _on_achievments_pressed():
	for i in parent_child:
		i.hide()
		if i == panel:
			i.show()
	Achieve_Size = true


func _on_challenges_pressed():
	for i in parent_child:
		i.hide()
		if i == panel:
			i.show()
	Challenge_Size = true


func _on_play_button_pressed():
	for i in parent_child:
		i.hide()
		if i == panel:
			i.show()
	Play_Size = true


func _on_tutorial_pressed():
	for i in parent_child:
		i.hide()
		if i == panel:
			i.show()
	Tutorial_Size = true


func _on_credits_pressed():
	for i in parent_child:
		i.hide()
		if i == panel:
			i.show()
	Credit_Size = true


func _on_youtube_pressed():
	OS.shell_open("https://youtube.com/@Huntrox77")


func _on_itch_pressed():
	OS.shell_open("https://huntrox77.itch.io/")
