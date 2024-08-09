extends Node
var ChallengeOneComplete = false
var ChallengeTwoComplete = false
var variables = [ChallengeOneComplete]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _reset():
	for i in variables:
		i = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
