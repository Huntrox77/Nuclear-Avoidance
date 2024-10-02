extends GridContainer
@onready var Modifier = get_node("/root/Modifiers")
var listofplayers = []
var PlayerNo = 0.75
var TRANSPARENT_DIST = 128
var OPAQUE_DIST = 255
# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerNo = 0.8
	listofplayers = Modifier.listofplayers
	for i in listofplayers:
		if i == true:
			PlayerNo += 0.1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	TRANSPARENT_DIST = 128 / PlayerNo
	OPAQUE_DIST = 255 / PlayerNo
	var Players = [Modifier.PlayerOne, Modifier.PlayerTwo, Modifier.PlayerThree, Modifier.PlayerFour, Modifier.PlayerFive]
	for i in get_children():
		var distance = 100000000
		for player in Players:
			if !is_instance_valid(player): continue
			var d = i.global_position.distance_to(player.global_position)
			if d < distance:
				distance = d
		if distance <= TRANSPARENT_DIST:
			i.color.a = 0
		elif distance >= OPAQUE_DIST:
			i.color.a = 1
		else:
			i.color.a = (distance - TRANSPARENT_DIST) / (OPAQUE_DIST - TRANSPARENT_DIST)
