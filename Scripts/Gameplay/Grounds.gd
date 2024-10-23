extends StaticBody2D
@onready var Modifier = get_node("/root/Modifiers")
@onready var timer = $Reappeartimer
@onready var Sprite = $Sprite2D
@onready var Collision = $CollisionShape2D
@onready var G_Sprite = preload("res://Sprites/Grounds/Ground.png")
@onready var G_Alt_Sprite = preload("res://Sprites/Grounds/GroundAlt.png")
@onready var G_Snow_Sprite = preload("res://Sprites/Grounds/GroundSnow.png")
@onready var G_Snow_Alt_Sprite = preload("res://Sprites/Grounds/GroundAltSnow.png")
@onready var GL_Snow_Sprite = preload("res://Sprites/Grounds/GroundLSnow.png")
@onready var GL_Sprite = preload("res://Sprites/Grounds/GroundL.png")
@onready var GR_Snow_Sprite = preload("res://Sprites/Grounds/GroundRSnow.png")
@onready var GR_Sprite = preload("res://Sprites/Grounds/GroundR.png")

# Changes the ground sprites based on the "slippery" modifier
func _ready():
	if has_meta("GroundM") == true:
		if randi_range(1,2) == 1:
			if Modifier.Ice == true:
				Sprite.texture = G_Snow_Sprite
			else:
				Sprite.texture = G_Sprite
		else :
			if Modifier.Ice == true:
				Sprite.texture = G_Snow_Alt_Sprite
			else:
				Sprite.texture = G_Alt_Sprite
	if has_meta("GroundL") == true:
		if Modifier.Ice == true:
			Sprite.texture = GL_Snow_Sprite
		else:
			Sprite.texture = GL_Sprite
	if has_meta("GroundR") == true:
		if Modifier.Ice == true:
			Sprite.texture = GR_Snow_Sprite
		else:
			Sprite.texture = GR_Sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Moves ground when hit by a bomb in the crumble gamemode
func _on_reappeartimer_timeout():
	position.y -= 1000
	pass # Replace with function body.
