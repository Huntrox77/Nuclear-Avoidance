extends Panel
var Slide1 = true
var Slide2 = false
var Slide3 = false
var Slide4 = false
var Slide5 = false
var Slide6 = false
var number = 0
var left_no = false
var right_no = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Shows the different tutorials based on currentyl chosen button
func _process(_delta):
	if get_child(0).button_pressed == true:
		get_parent().get_child(2).show()
	else:
		get_parent().get_child(2).hide()

	if get_child(1).button_pressed == true:
		get_parent().get_child(3).show()
	else:
		get_parent().get_child(3).hide()

	if get_child(2).button_pressed == true:
		get_parent().get_child(4).show()
	else:
		get_parent().get_child(4).hide()

	if get_child(3).button_pressed == true:
		get_parent().get_child(5).show()
	else:
		get_parent().get_child(5).hide()

	if get_child(4).button_pressed == true:
		get_parent().get_child(6).show()
	else:
		get_parent().get_child(6).hide()
	
	if get_child(5).button_pressed == true:
		get_parent().get_child(7).show()
	else:
		get_parent().get_child(7).hide()


# sets displayed tutorial to chosen button
func _on_button_pressed():
	for i in get_children():
		if i != get_child(0):
			i.button_pressed = false


# sets displayed tutorial to chosen button
func _on_button_2_pressed():
	for i in get_children():
		if i != get_child(1):
			i.button_pressed = false


# sets displayed tutorial to chosen button
func _on_button_3_pressed():
	for i in get_children():
		if i != get_child(2):
			i.button_pressed = false


# sets displayed tutorial to chosen button
func _on_button_4_pressed():
	for i in get_children():
		if i != get_child(3):
			i.button_pressed = false


# sets displayed tutorial to chosen button
func _on_button_5_pressed():
	for i in get_children():
		if i != get_child(4):
			i.button_pressed = false


# sets displayed tutorial to chosen button
func _on_button_6_pressed():
	for i in get_children():
		if i != get_child(5):
			i.button_pressed = false


# sets displayed tutorial to the lefter button
func _on_left_pressed():
	for i in get_children():
		if left_no == false:
			if i is TextureButton:
				number += 1
			if i.button_pressed == true:
				i.button_pressed = false
				get_child(number - 2).button_pressed = true
				number = 0
				left_no = true
	left_no = false


# sets displayed tutorial to the righter button
func _on_right_pressed():
	for i in get_children():
		if right_no == false:
			if i is TextureButton:
				if i == get_child(5):
					number -= 5
				else:
					number += 1
			if i.button_pressed == true:
				i.button_pressed = false
				get_child(number).button_pressed = true
				number = 0
				right_no = true
	right_no = false

