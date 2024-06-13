extends RichTextLabel

@onready var Modifier = get_node("/root/Modifiers")

var smashno = 0.09
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Smashbros == false:
		text = ""
	else:
		smashno = Modifier.p2aircontrol
		if smashno == 0.08:
			text = "Player 2: 90% Control left"
		if smashno == 0.07:
			text = "Player 2: 80% Control left"
		if smashno == 0.06:
			text = "Player 2: 70% Control left"
		if smashno == 0.05:
			text = "Player 2: 60% Control left"
		if smashno == 0.04:
			text = "Player 2: 50% Control left"
		if smashno == 0.03:
			text = "Player 2: 40% Control left"
		if smashno == 0.02:
			text = "Player 2: 30% Control left"
		if smashno == 0.01:
			text = "Player 2: 20% Control left"
		if smashno == 0.00:
			text = "Player 2: 10% Control left"
		if smashno <= 0.00:
			text = "Player 2: 0% Control left"
