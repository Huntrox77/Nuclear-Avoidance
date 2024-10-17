extends Panel
var Slide1 = true
var Slide2 = false
var Slide3 = false
var Slide4 = false
var Slide5 = false
var Slide6 = false
var number = 0
var leftno = false
var rightno = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	for i in get_children():
		if i != get_child(0):
			i.button_pressed = false


func _on_button_2_pressed():
	for i in get_children():
		if i != get_child(1):
			i.button_pressed = false


func _on_button_3_pressed():
	for i in get_children():
		if i != get_child(2):
			i.button_pressed = false


func _on_button_4_pressed():
	for i in get_children():
		if i != get_child(3):
			i.button_pressed = false


func _on_button_5_pressed():
	for i in get_children():
		if i != get_child(4):
			i.button_pressed = false


func _on_button_6_pressed():
	for i in get_children():
		if i != get_child(5):
			i.button_pressed = false


func _on_left_pressed():
	for i in get_children():
		if leftno == false:
			if i is TextureButton:
				number += 1
			if i.button_pressed == true:
				i.button_pressed = false
				get_child(number - 2).button_pressed = true
				number = 0
				leftno = true
	leftno = false


func _on_right_pressed():
	for i in get_children():
		if rightno == false:
			if i is TextureButton:
				number += 1
			if i.button_pressed == true:
				i.button_pressed = false
				get_child(number).button_pressed = true
				number = 0
				rightno = true
	rightno = false

