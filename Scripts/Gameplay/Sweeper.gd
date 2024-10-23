extends Area2D
@onready var Modifier = get_node("/root/Modifiers")
@onready var DOG_Sprite = preload("res://Sprites/InGame/DOG.png")
var sweeping_dir = false
var random_sweeper_place_16 = randi_range(1,6)


# Sets the texture if clam on or off, sets the spawn pos of the sweeper for different maps.
func _ready():
	random_sweeper_place_16 = randi_range(1,6)
	if Modifier.Clam == true:
		$Sprite2D.texture = DOG_Sprite
		$Sprite2D.position.x = -130
		$CollisionPolygon2D.scale.x = 4.788
		$CollisionPolygon2D.position.x = -114.712
		if Modifier.DOG_MUSIC2 == false:
			Modifier.DOG_MUSIC = true
			Modifier.DOG_MUSIC2 = true
	if Modifier.current_map == "map1":
		if randi_range(1,2) == 1:
			position.x = -287
			position.y = -176
		else:
			position.x = 287
			position.y = -176
			sweeping_dir = not sweeping_dir
	if Modifier.current_map == "map2" or "map3" or "map4":
		if random_sweeper_place_16 == 1:
			position.x = -600
			position.y = -176
		elif random_sweeper_place_16 == 2:
			position.x = -200
			position.y = -176
			sweeping_dir = not sweeping_dir
		elif random_sweeper_place_16 == 3:
			position.x = -200
			position.y = -176
		elif random_sweeper_place_16 == 4:
			position.x = 200
			position.y = -176
			sweeping_dir = not sweeping_dir
		elif random_sweeper_place_16 == 5:
			position.x = 200
			position.y = -176
		elif random_sweeper_place_16 == 6:
			position.x = 600
			position.y = -176
			sweeping_dir = not sweeping_dir


# Moves the sweeper in its current direction
func _process(_delta):
	if Modifier.Sweeper == true:
		if sweeping_dir == false:
			position += Vector2(5, 0) # Movement
			scale.x = 1
		else:
			position += Vector2(-5, 0) # Movement
			scale.x = -1
	pass


func _on_body_entered(body):
	if body.has_meta("Player"):
		body.velocity = (self.global_position.direction_to(body.global_position) * 3100)
		body.velocity.y = randi_range(-300, -600)
	pass # Replace with function body.


# Queue frees the sweeper
func _on_kill_thy_self_timeout():
	queue_free()
	pass # Replace with function body.

# Changes the sweeper direction on timeout
func _on_sweepingtime_timeout():
	sweeping_dir = not sweeping_dir
	pass # Replace with function body.
