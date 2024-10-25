extends Panel
@onready var Modifier = get_node("/root/Modifiers")
var p1_color
var p2_color
var p3_color
var p4_color


# sets the color to the one from the modifier, effectivly remembering it
func _ready():
	$P1.color = Color(Modifier.p1_color)
	$P2.color = Color(Modifier.p2_color)
	$P3.color = Color(Modifier.p3_color)
	$P4.color = Color(Modifier.p4_color)


# Sets the color chosen in the modifiers
func _process(_delta):
	p1_color = Color($P1.color)
	p2_color = Color($P2.color)
	p3_color = Color($P3.color)
	p4_color = Color($P4.color)
	Modifier.p1_color = p1_color
	Modifier.p2_color = p2_color
	Modifier.p3_color = p3_color
	Modifier.p4_color = p4_color
