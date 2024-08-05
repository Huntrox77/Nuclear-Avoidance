extends GridContainer
@onready var GlobalText = get_node("/root/GlobalTexts")
@onready var Modifier = get_node("/root/Modifiers")

var Challenge1Beat = false
var Challenge2Beat = false
var Challenge3Beat = false
var Challenge4Beat = false
var Challenge5Beat = false
var Challenge6Beat = false
var Challenge7Beat = false
var Challenge8Beat = false
var Challenge9Beat = false
var Challenge10Beat = false
var Challenge11Beat = false
var Challenge12Beat = false
var Challenge13Beat = false
var Challenge14Beat = false
var Challenge15Beat = false
var Challenge16Beat = false
var Challenge17Beat = false
var Challenge18Beat = false
var Challenge19Beat = false
var Challenge20Beat = false
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalText.ChallengeText = "Challenge 1"
	GlobalText.ChallengeTextVis = 0
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	GlobalText.ChallengeText = "Challenge 1"
	GlobalText.ChallengeTextVis = 0
	Modifier.ChallengeNo = 1


func _on_button_2_pressed():
	GlobalText.ChallengeText = "Challenge 2"
	GlobalText.ChallengeTextVis = 0
	Modifier.ChallengeNo = 2


func _on_play_pressed():
	if Modifier.ChallengeNo == 1:
		get_tree().change_scene_to_file("res://Scenes/Challenges/Challenge_1.tscn")
