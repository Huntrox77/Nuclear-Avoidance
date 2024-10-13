extends Button
var parentchild = null
var panel = null
var SettingsSize = false
# Called when the node enters the scene tree for the first time.
func _ready():
	panel = get_parent().get_child(3)
	parentchild = get_parent().get_children()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if SettingsSize == true:
		if panel.size.x <= 420:
			SettingsSize = false
			get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")
		elif SettingsSize == true:
			panel.size.x -= 10
			panel.position.x -= 0.3
			panel.size.y += 0.33
			panel.position.y -= 0.2


func _on_pressed():
	# Code to change the scene to the game.
	if name == "Back Button":
		for i in parentchild:
			i.hide()
			if i == panel or i.name == "Sky2":
				i.show()
		SettingsSize = true
	else:
		if name == "Back2Modifiers":
			get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
