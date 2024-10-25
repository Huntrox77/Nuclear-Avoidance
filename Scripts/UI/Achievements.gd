extends ScrollContainer
@onready var Saves = get_node("/root/ConfigScript")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# checks the save data and toggles
func _process(_delta):
	if Saves.Challenge_One_Complete == true:
		$"Container/Achievement 1/RedX".hide()
		$"Container/Achievement 1/Check".show()
	if Saves.Challenge_Two_Complete == true:
		$"Container/Achievement 2/RedX".hide()
		$"Container/Achievement 2/Check".show()
	if Saves.Challenge_Three_Complete == true:
		$"Container/Achievement 3/RedX".hide()
		$"Container/Achievement 3/Check".show()
	if Saves.Challenge_Four_Complete == true:
		$"Container/Achievement 4/RedX".hide()
		$"Container/Achievement 4/Check".show()
