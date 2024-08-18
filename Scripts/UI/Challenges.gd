extends GridContainer
@onready var GlobalText = get_node("/root/GlobalTexts")
@onready var Modifier = get_node("/root/Modifiers")
@onready var Save = get_node("/root/KeepBetweenSaves")

# Called when the node enters the scene tree for the first time.
func _ready():
	Modifier.ChallengeOrLocal = "local"
	GlobalText.ChallengeText = "Challenge 1"
	GlobalText.ChallengeTextVis = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	GlobalText.ChallengeText = "Challenge 1"
	GlobalText.DescText = "Challenge 1: Survive for 45 seconds"
	GlobalText.ChallengeTextVis = 0
	Modifier.ChallengeNo = 1


func _on_button_2_pressed():
	GlobalText.ChallengeText = "Challenge 2"
	GlobalText.DescText = "Challenge 2: Survive for 60 seconds"
	GlobalText.ChallengeTextVis = 0
	Modifier.ChallengeNo = 2


func _on_play_pressed():
	Modifier.reset = true
	if Modifier.ChallengeNo == 1:
		get_tree().change_scene_to_file("res://Scenes/Challenges/Challenge_1.tscn")
		Modifier.currentmap = "map1"
	if Modifier.ChallengeNo == 2:
		get_tree().change_scene_to_file("res://Scenes/Challenges/Challenge_2.tscn")
		Modifier.currentmap = "map2"


