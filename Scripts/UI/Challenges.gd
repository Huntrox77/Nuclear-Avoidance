extends GridContainer
@onready var Global_Text = get_node("/root/GlobalTexts")
@onready var Modifier = get_node("/root/Modifiers")
@onready var Save = get_node("/root/ConfigScript")
@onready var Image1 = preload("res://Sprites/UI/Challenge1.png")
@onready var Image2 = preload("res://Sprites/UI/Challenge2.png")
@onready var Image3 = preload("res://Sprites/UI/Challenge3.png")
@onready var Image4 = preload("res://Sprites/UI/Challenge4.png")
@onready var Image5 = null

# Sets the stuff needed for the challenge UI to work
func _ready():
	Modifier.Challenge_Or_Local = "local"
	Global_Text.Challenge_Text_Vis = 0
	pass # Replace with function body.


# challenge text function
func _process(_delta):
	Global_Text.Challenge_Text = "Challenge " + str(Modifier.Challenge_No)



# Shows the challenge desc and image
func _on_button_pressed():
	Global_Text.Desc_Text = "Challenge 1: Survive for 45 seconds"
	Global_Text.Challenge_Text_Vis = 0
	Modifier.Challenge_No = 1
	$"../Image Panel/TextureRect".texture = Image1


# Shows the challenge desc and image
func _on_button_2_pressed():
	Global_Text.Desc_Text = "Challenge 2: Survive for 60 seconds"
	Global_Text.Challenge_Text_Vis = 0
	Modifier.Challenge_No = 2
	$"../Image Panel/TextureRect".texture = Image2


# Shows the challenge desc and image
func _on_button_3_pressed():
	Global_Text.Desc_Text = "Challenge 3: Survive for 30 seconds"
	Global_Text.Challenge_Text_Vis = 0
	Modifier.Challenge_No = 3
	$"../Image Panel/TextureRect".texture = Image3


# Shows the challenge desc and image
func _on_button_4_pressed():
	Global_Text.Desc_Text = "Challenge 4: Survive for 60 seconds"
	Global_Text.Challenge_Text_Vis = 0
	Modifier.Challenge_No = 4
	$"../Image Panel/TextureRect".texture = Image4


# Shows the challenge desc and image
func _on_button_5_pressed():
	Global_Text.Desc_Text = "More Challenges Coming Soon!"
	Global_Text.Challenge_Text_Vis = 0
	Modifier.Challenge_No = 5
	$"../Image Panel/TextureRect".texture = Image5



# plays selected challenge
func _on_play_pressed():
	Modifier.reset = true
	if Modifier.Challenge_No == 1:
		get_tree().change_scene_to_file("res://Scenes/Challenges/Challenge_1.tscn")
		Modifier.current_map = "map1"
	if Modifier.Challenge_No == 2:
		get_tree().change_scene_to_file("res://Scenes/Challenges/Challenge_2.tscn")
		Modifier.current_map = "map2"
	if Modifier.Challenge_No == 3:
		get_tree().change_scene_to_file("res://Scenes/Challenges/Challenge_3.tscn")
		Modifier.current_map = "map7"
	if Modifier.Challenge_No == 4:
		get_tree().change_scene_to_file("res://Scenes/Challenges/Challenge_4.tscn")
		Modifier.current_map = "map7"

