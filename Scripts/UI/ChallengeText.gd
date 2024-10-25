extends Label
@onready var Global_Text = get_node("/root/GlobalTexts")
@onready var Modifier = get_node("/root/Modifiers")
var Vis = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# More challenge UI text stuff
func _process(_delta):
	if name == "ChallengeText":
		text = Global_Text.Challenge_Text
		visible_ratio = 1
	else:
		Vis = Global_Text.Challenge_Text_Vis
		visible_ratio = Vis
		text = Global_Text.Desc_Text
