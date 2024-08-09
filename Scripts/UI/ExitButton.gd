extends Button
var parentchild = get_parent()
var panel = get_parent()
var SettingsSize = false
var AchieveSize = false
var ChallengeSize = false

# Called when the node enters the scene tree for the first time.
func _ready():
	panel = get_parent().get_child(6)
	parentchild = get_parent().get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if panel.size.x >= 1105:
		if AchieveSize == true:
			AchieveSize = false
			get_tree().change_scene_to_file("res://Scenes/Menus/achievements.tscn")
		elif SettingsSize == true:
			SettingsSize = false
			get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")
		elif ChallengeSize == true:
			get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
	elif SettingsSize or AchieveSize or ChallengeSize == true:
		panel.size.x += 10
		panel.position.x += 0.3
		panel.size.y -= 0.33
		panel.position.y += 0.2


func _on_pressed():
	# Code to change the scene to the game.
	get_tree().quit()
	pass # Replace with function body.


func _on_settings_pressed():
	for i in parentchild:
		i.hide()
		if i == panel:
			i.show()
	SettingsSize = true


func _on_achievments_pressed():
	for i in parentchild:
		i.hide()
		if i == panel:
			i.show()
	AchieveSize = true


func _on_challenges_pressed():
	for i in parentchild:
		i.hide()
		if i == panel:
			i.show()
	ChallengeSize = true
	pass # Replace with function body.
