extends GridContainer
@onready var Modifier = get_node("/root/Modifiers")
var list_of_players = []
var Player_No = 0.75
var TRANSPARENT_DIST = 128
var OPAQUE_DIST = 255

# Gets the amount of players and sets fog density to counter it.
func _ready():
	Player_No = 0.8
	list_of_players = Modifier.list_of_players
	for i in list_of_players:
		if i == true:
			Player_No += 0.1



func _process(_delta):
	# This gets the distance between the players and the furthest fog piece they can view due to their view distances, which is based on the density of the fog (due to more or less players)
	TRANSPARENT_DIST = 128 / Player_No
	OPAQUE_DIST = 255 / Player_No
	var Players = [Modifier.Player_One, Modifier.Player_Two, Modifier.Player_Three, Modifier.Player_Four, Modifier.Player_Five]
	var Lamps = [Modifier.Lamp_One, Modifier.Lamp_Two]
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
		# Same thing but for the lamps in a level
		for lamp in Lamps:
			if !is_instance_valid(lamp): continue
			var d = i.global_position.distance_to(lamp.global_position)
			if d < distance:
				distance = d
		if distance <= TRANSPARENT_DIST:
			i.color.a = 0
		elif distance >= OPAQUE_DIST:
			i.color.a = 1
		else:
			i.color.a = (distance - TRANSPARENT_DIST) / (OPAQUE_DIST - TRANSPARENT_DIST)
