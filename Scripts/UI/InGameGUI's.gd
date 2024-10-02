extends Label

@onready var Modifier = get_node("/root/Modifiers")

var smashno = 0.09
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.UISize == 0:
		scale.x = 1
		scale.y = 1
	if Modifier.UISize == 1:
		scale.x = 0.85
		scale.y = 0.85
	if Modifier.UISize == 2:
		scale.x = 0.7
		scale.y = 0.7
	# AirControls
	if name == "P1":
		smashno = Modifier.p1aircontrol
		text = "Player 1: " + str(Modifier.p1aircontrol * 1000 + 10) + "%"
	if name == "P2":
		smashno = Modifier.p2aircontrol
		text = "Player 2: " + str(Modifier.p2aircontrol * 1000 + 10) + "%"
	if name == "P3":
		smashno = Modifier.p3aircontrol
		text = "Player 3: " + str(Modifier.p3aircontrol * 1000 + 10) + "%"
	if name == "P4":
		smashno = Modifier.p4aircontrol
		text = "Player 4: " + str(Modifier.p4aircontrol * 1000 + 10) + "%"
	# Scores
	if name == "P1Score":
		text = "P1 Points: " + str(Modifier.P1Points)
	if name == "P2Score":
		text = "P2 Points: " + str(Modifier.P2Points)
	if name == "P3Score":
		text = "P3 Points: " + str(Modifier.P3Points)
	if name == "P4Score":
			text = "P4 Points: " + str(Modifier.P4Points)
	
	if Modifier.Smashbros == false:
		if name == "P1":
			hide()
		if name == "P2":
			hide()
		if name == "P3":
			hide()
		if name == "P4":
			hide()
	else:
		show()
