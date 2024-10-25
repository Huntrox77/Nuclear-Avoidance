extends Area2D
@export var Ground_Left:PackedScene
@onready var Modifier = get_node("/root/Modifiers")
@onready var Config = get_node("/root/ConfigScript")
var Players = null
var random_music = randi_range(1,3)

# Play music in-game gets all the players in-game and turns collision on for them if the chosen modifier is on.
func _ready():
	# fullscreens stuff and yk?
	if Config.Window_Mode == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif Config.Window_Mode == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if Modifier.game_playing == true:
		if (
				not Modifier.current_map == "map9" 
				and not Modifier.current_map == "map10" 
				and not Modifier.current_map == "map12" 
				and not Modifier.current_map == "map13"
				and not Modifier.current_map == "map14"
		):
			if name == "void":
				if random_music == 1:
					$Outskirts.play()
				elif random_music == 2:
					$SkyIslands.play()
				elif random_music == 3:
					$FarmArrays.play()
		else:
			$Cave.play()
	
	if name == "void":
		Players = get_parent().get_child(2).get_children()
		$ColorRect.hide()
		$RichTextLabel.hide()
		if Modifier.Collide == true:
			for i in Players:
				i.get_child(2).one_way_collision = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.DOG_MUSIC == true:
		$UniCollapse.play()
		$ColorRect.show()
		$RichTextLabel.show()
		Modifier.DOG_MUSIC = false
		$TextTimer.start()


# Kills Players on enter
func _on_body_entered(body):
	# Sets the object, that enters its area, to be at x and y 0.
	if body.name == "Player 1":
		Modifier.P1_Alive = false
	elif body.name == "Player 2":
		Modifier.P2_Alive = false
	elif body.name == "Player 3":
		Modifier.P3_Alive = false
	elif body.name == "Player 4":
		Modifier.P4_Alive = false
	elif body.name == "Player 5":
		Modifier.P5_Alive = false
	body.queue_free()
	Modifier.players_left -= 1
	pass # Replace with function body.


# Gets rid of text on countdown end
func _on_text_timer_timeout():
	$RichTextLabel.hide()
	pass # Replace with function body.


# Kills nukes of screen
func _on_area_entered(area):
	area.queue_free()
