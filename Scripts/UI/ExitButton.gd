extends Button
@onready var GlobalText = get_node("/root/GlobalTexts")
@onready var Modifier = get_node("/root/Modifiers")
var parentchild = get_parent()
var panel = get_parent()
var SettingsSize = false
var AchieveSize = false
var ChallengeSize = false
var PlaySize = false
var CreditSize = false
var CreditSizeBack = false
var TutorialSize = false
var TutorialSizeBack = false

# Called when the node enters the scene tree for the first time.
func _ready():
	panel = get_parent().get_child(8)
	parentchild = get_parent().get_children()
	if panel.get_child(0) is Container:
		panel.get_child(0).get_child(0).position.y = 660


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(GlobalText.textspeed)
	if panel.get_child(0) is Container:
		if GlobalText.textspeed == 1:
			panel.get_child(0).get_child(0).position.y -= 1
		if GlobalText.textspeed == 0.03:
			panel.get_child(0).get_child(0).position.y -= 0.66
		if GlobalText.textspeed == 0.02:
			panel.get_child(0).get_child(0).position.y -= 0.33
		if GlobalText.textspeed == 0.01:
			panel.get_child(0).get_child(0).position.y -= 0.25
	if panel.size.x >= 1105:
		if AchieveSize == true:
			AchieveSize = false
			get_tree().change_scene_to_file("res://Scenes/Menus/achievements.tscn")
		elif SettingsSize == true:
			SettingsSize = false
			get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")
		elif ChallengeSize == true:
			get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
		elif PlaySize == true:
			get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
	elif SettingsSize or AchieveSize or ChallengeSize or PlaySize == true:
		panel.size.x += 10
		panel.position.x += 0.3
		panel.size.y -= 0.33
		panel.position.y += 0.2
		panel.get_child(0).scale.x += 0.1
		panel.get_child(0).scale.y -= 0.0033
	elif CreditSize == true:
		panel.position.x += 5
		if panel.position.x >= 365:
			Modifier.currentmap = "credits"
			get_tree().change_scene_to_file("res://Scenes/Menus/Credits.tscn")
	elif CreditSizeBack == true:
		panel.position.x -= 5
		if panel.position.x <= 0:
			Modifier.currentmap = "menu"
			get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")
	elif TutorialSize == true:
		panel.position.x += 5
		panel.size.y -= 4
		panel.position.y += 2
		if panel.position.x >= 365:
			Modifier.currentmap = "credits"
			get_tree().change_scene_to_file("res://Scenes/Menus/Tutorial.tscn")
	elif TutorialSizeBack == true:
		panel.position.x -= 5
		panel.size.y += 4
		panel.position.y -= 2
		if panel.position.x <= 0:
			Modifier.currentmap = "menu"
			get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")



func _on_pressed():
	# Code to change the scene to the game.
	if name == "EndCredits":
		for i in get_parent().get_children():
			i.hide()
			if i == panel:
				i.show()
		CreditSizeBack = true
	elif name == "EndTutorial":
		for i in get_parent().get_children():
			i.hide()
			if i == panel:
				i.show()
		TutorialSizeBack = true
	else:
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


func _on_play_button_pressed():
	for i in parentchild:
		i.hide()
		if i == panel:
			i.show()
	PlaySize = true


func _on_tutorial_pressed():
	for i in parentchild:
		i.hide()
		if i == panel:
			i.show()
	TutorialSize = true


func _on_credits_pressed():
	for i in parentchild:
		i.hide()
		if i == panel:
			i.show()
	CreditSize = true


func _on_youtube_pressed():
	OS.shell_open("https://youtube.com/@Huntrox77")


func _on_itch_pressed():
	OS.shell_open("https://huntrox77.itch.io/")
