extends Label

@onready var Modifier = get_node("/root/Modifiers")

var smash_no = 0.09
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# UI SIZE
	if Modifier.UI_Size == 0:
		scale.x = 1
		scale.y = 1
	if Modifier.UI_Size == 1:
		scale.x = 0.85
		scale.y = 0.85
	if Modifier.UI_Size == 2:
		scale.x = 0.7
		scale.y = 0.7
	# Shows how much control in the air the players have 
	if name == "P1":
		smash_no = Modifier.p1_air_control
		text = "Player 1: " + str(Modifier.p1_air_control * 1000 + 10) + "%"
	if name == "P2":
		smash_no = Modifier.p2_air_control
		text = "Player 2: " + str(Modifier.p2_air_control * 1000 + 10) + "%"
	if name == "P3":
		smash_no = Modifier.p3_air_control
		text = "Player 3: " + str(Modifier.p3_air_control * 1000 + 10) + "%"
	if name == "P4":
		smash_no = Modifier.p4_air_control
		text = "Player 4: " + str(Modifier.p4_air_control * 1000 + 10) + "%"
	# Scores
	if name == "P1Score":
		text = "P1 Points: " + str(Modifier.P1_Points)
	if name == "P2Score":
		text = "P2 Points: " + str(Modifier.P2_Points)
	if name == "P3Score":
		text = "P3 Points: " + str(Modifier.P3_Points)
	if name == "P4Score":
		text = "P4 Points: " + str(Modifier.P4_Points)

#if modifier is not on, hide UI
	if Modifier.Smash_bros == false:
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
