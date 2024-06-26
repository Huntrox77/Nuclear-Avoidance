extends Area2D
@onready var Modifier = get_node("/root/Modifiers")
@onready var DOGSprite = preload("res://Sprites/DOG.png")
var sweepingdir = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if Modifier.DOG == true:
		$Sprite2D.texture = DOGSprite
		$Sprite2D.position.x = -130
		$CollisionPolygon2D.scale.x = 4.788
		$CollisionPolygon2D.position.x = -114.712
		if Modifier.DOGMUSIC2 == false:
			Modifier.DOGMUSIC = true
			Modifier.DOGMUSIC2 = true
	if Modifier.currentmap == "map2":
		if randi_range(1,2) == 1:
			sweepingdir = not sweepingdir
	if randi_range(1,2) == 1:
		position.x = -287
		position.y = -176
	else:
		position.x = 287
		position.y = -176
		sweepingdir = not sweepingdir
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.Sweeper == true:
		if sweepingdir == false:
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


func _on_kill_thy_self_timeout():
	queue_free()
	pass # Replace with function body.


func _on_sweepingtime_timeout():
	sweepingdir = not sweepingdir
	pass # Replace with function body.
