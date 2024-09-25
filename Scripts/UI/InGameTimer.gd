extends Label
@onready var Modifier = get_node("/root/Modifiers")
var Empty = preload("res://StyleBoxes/EmptyOutline_StyleBox.tres")
var No = 0.00
var Number = "%.2f" % No
var Minute = 0
var Trans
# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = -625
	Trans = get_parent().get_node("Trans")	
	hide()
	Trans.hide()
	Trans.position.y = -625
	if Modifier.InTimer == 0:
		print(Modifier.InTimer)
	elif Modifier.InTimer == 1:
		hide()
		Trans.show()
	elif Modifier.InTimer == 2:
		show()
		Trans.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	No += 0.01
	Number = "%.2f" % No
	text = str(Minute) + ":" + Number
	Trans.text = str(Minute) + ":" + Number
	if No >= 59.99:
		Minute += 1
		No = 0
	if No <= 10.00:
		text = str(Minute) + ":" + "0" + Number
		Trans.text = str(Minute) + ":" + "0" + Number
