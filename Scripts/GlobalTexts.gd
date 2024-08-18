extends Node
var ChallengeText = ""
var ChallengeTextVis = 0
var textspeed = 1
var KeepChoice = 0
var DescText = "Desc Goes Here"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if ChallengeTextVis == 1:
		pass
	else:
		ChallengeTextVis += textspeed
