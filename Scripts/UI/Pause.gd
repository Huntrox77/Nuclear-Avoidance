extends Control
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.pause == false:
		for i in get_children():
			if i.scale.x > 0:
				i.scale.x -= 0.05
				i.scale.y -= 0.05
			if i.scale.x <= 0:
				i.hide()
	elif Modifier.pause == true:
		for i in get_children():
			i.show()
			if i.scale.x < 1.5:
				i.scale.x += 0.05
				i.scale.y += 0.05


func _on_resume_pressed():
	Modifier.pause = false
	get_tree().paused = false


func _on_title_pressed():
	Modifier.pause = false
	get_tree().paused = false
	if Modifier.gameplaying == true:
			Modifier.playersleft = 0
			Modifier._reset()
			get_tree().change_scene_to_file("res://Scenes/Menus/titlescreen.tscn")


func _on_previous_pressed():
	Modifier.pause = false
	get_tree().paused = false
	if Modifier.gameplaying == true:
			Modifier.playersleft = 0
			Modifier._reset()
			if Modifier.ChallengeOrLocal == "local":
				get_tree().change_scene_to_file("res://Scenes/Menus/modifiers&players.tscn")
			elif Modifier.ChallengeOrLocal == "Challenge":
				get_tree().change_scene_to_file("res://Scenes/Menus/challenge_select.tscn")
