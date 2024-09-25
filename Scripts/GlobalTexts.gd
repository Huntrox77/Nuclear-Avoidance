extends Node
var ChallengeText = "Challenge 1"
var ChallengeTextVis = 0
var textspeed = 1
var DescText = "Challenge 1: Survive for 45 seconds"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if ChallengeTextVis == 1:
		pass
	else:
		ChallengeTextVis += textspeed
