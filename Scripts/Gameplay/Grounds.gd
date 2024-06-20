extends StaticBody2D
@onready var Modifier = get_node("/root/Modifiers")
@onready var timer = $Reappeartimer
@onready var Sprite = $Sprite2D
@onready var Collision = $CollisionShape2D
@onready var GSprite = preload("res://Sprites/Ground.png")
@onready var GAltSprite = preload("res://Sprites/GroundAlt.png")
@onready var GSnowSprite = preload("res://Sprites/GroundSnow.png")
@onready var GSnowAltSprite = preload("res://Sprites/GroundAltSnow.png")
@onready var GLSnowSprite = preload("res://Sprites/GroundLSnow.png")
@onready var GLSprite = preload("res://Sprites/GroundL.png")
@onready var GRSnowSprite = preload("res://Sprites/GroundRSnow.png")
@onready var GRSprite = preload("res://Sprites/GroundR.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	if has_meta("GroundM") == true:
		if randi_range(1,2) == 1:
			if Modifier.Ice == true:
				Sprite.texture = GSnowSprite
			else:
				Sprite.texture = GSprite
		else :
			if Modifier.Ice == true:
				Sprite.texture = GSnowAltSprite
			else:
				Sprite.texture = GAltSprite
	if has_meta("GroundL") == true:
		if Modifier.Ice == true:
			Sprite.texture = GLSnowSprite
		else:
			Sprite.texture = GLSprite
	if has_meta("GroundR") == true:
		if Modifier.Ice == true:
			Sprite.texture = GRSnowSprite
		else:
			Sprite.texture = GRSprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_reappeartimer_timeout():
	position.y -= 1000
	pass # Replace with function body.
