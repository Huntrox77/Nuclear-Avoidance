extends Node
var Challenge_Text = "Challenge 1"
var Challenge_Text_Vis = 0
var text_speed = 1
var Desc_Text = "Challenge 1: Survive for 45 seconds"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Textspeed scripter lol
func _process(_delta):
	if Challenge_Text_Vis == 1:
		pass
	else:
		Challenge_Text_Vis += text_speed
