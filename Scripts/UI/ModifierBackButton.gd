extends Button
var parent_child = null
var panel = null
var Settings_Size = false


# Sets it up
func _ready():
	panel = get_parent().get_child(3)
	parent_child = get_parent().get_children()
	pass # Replace with function body.


# makes the BG do the funny when screen trans-ing
func _process(_delta):
	if Settings_Size == true:
		if panel.size.x <= 420:
			Settings_Size = false
			get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")
		elif Settings_Size == true:
			panel.size.x -= 10
			panel.position.x -= 0.3
			panel.size.y += 0.33
			panel.position.y -= 0.2


# makes the BG do the funny when screen trans-ing
func _on_pressed():
	# Code to change the scene to the game.
	if name == "Back Button":
		for i in parent_child:
			i.hide()
			if i == panel or i.name == "Sky2":
				i.show()
		Settings_Size = true
	else:
		if name == "Back2Modifiers":
			get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
