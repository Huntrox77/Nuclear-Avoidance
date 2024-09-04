extends TextureButton
@onready var Config = get_node("/root/ConfigScript")
var ParentButton
var VContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	ParentButton = get_parent()
	VContainer = get_parent().get_parent()

	for i in Config.Favourites:
		VContainer.move_child.call_deferred(VContainer.get_node(i), 0)
		if str(ParentButton.name) in Config.Favourites:
			button_pressed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pressed():
	if button_pressed == true:
		VContainer.move_child(ParentButton, 0)
		Config.Favourites += [str(ParentButton.name)]
	else:
		VContainer.move_child(ParentButton, 9)
		Config.Favourites.erase(str(ParentButton.name))
