extends TextureButton
@onready var Config = get_node("/root/ConfigScript")
var Parent_Button
var V_Container

# Sets up the variables
func _ready():
	Parent_Button = get_parent()
	V_Container = get_parent().get_parent()

# moves the favourited ones to the top
	for i in Config.Favourites:
		V_Container.move_child.call_deferred(V_Container.get_node(i), 0)
		if str(Parent_Button.name) in Config.Favourites:
			button_pressed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# favourites or unfavourites based on config
func _on_pressed():
	if button_pressed == true:
		V_Container.move_child(Parent_Button, 0)
		Config.Favourites += [str(Parent_Button.name)]
	else:
		V_Container.move_child(Parent_Button, 9)
		Config.Favourites.erase(str(Parent_Button.name))
