extends Sprite2D
var cloud = randi_range(1,3)

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = randf_range(0.25, 0.4)
	scale.y = randf_range(0.25, 0.4)
	cloud = randi_range(1,3)
	if cloud == 1:
		if name == "Cloud1":
			#show()
			pass
	elif cloud == 2:
		if name == "Cloud2":
			#show()
			pass
	elif cloud == 3:
		if name == "Cloud3":
			#show()
			pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x -= 1
