extends Label

@onready var Modifier = get_node("/root/Modifiers")

var smashno = 0.09
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Smashbros == false:
		position.x = 100000
	else:
		smashno = Modifier.p4aircontrol
		text = "Player 4: " + str(Modifier.p4aircontrol * 1000 + 10) + "%"
