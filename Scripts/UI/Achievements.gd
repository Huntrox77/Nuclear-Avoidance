extends ScrollContainer
@onready var Saves = get_node("/root/KeepBetweenSaves")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Saves.ChallengeOneComplete == true:
		$"Container/Achievement 1/RedX".hide()
		$"Container/Achievement 1/Check".show()
