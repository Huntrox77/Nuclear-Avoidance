extends Node
@onready var GlobalVar = get_node("/root/Moreglobalvars")
var vel1 = 0.0
var vel2 = 0.0
var vel3 = 0.0
var vel4 = 0.0
var vel5 = 0.0
var distance = 0.0
var portal1 = null
var portal2 = null

# Called when the node enters the scene tree for the first time.
func _ready():
	portal1 = get_child(0)
	portal2 = get_child(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#Orange
func _on_p_1_body_entered(body):
	if body.has_meta("Player"):
		distance = body.position.x - portal1.position.x
		if portal2.name == "P2-30":
			body.position = portal2.position + Vector2(25, -50)
		else:
			body.position = portal2.position + Vector2(distance, -20)
		if portal2.name == "P2-30":
			if body.name == "Player 1":
				body.velocity.y = -vel1 * 0.9
				body.velocity.x = -vel1 * 0.7
			elif body.name == "Player 2":
				body.velocity.y = -vel2 * 0.9
				body.velocity.x = -vel2 * 0.7
			elif body.name == "Player 3":
				body.velocity.y = -vel3 * 0.9
				body.velocity.x = -vel3 * 0.7
			elif body.name == "Player 4":
				body.velocity.y = -vel4 * 0.9
				body.velocity.x = -vel4 * 0.7
			elif body.name == "Player 5":
				body.velocity.y = -vel5 * 0.9
				body.velocity.x = -vel5 * 0.7
		else:
			if body.name == "Player 1":
				body.velocity.y = -vel1
			elif body.name == "Player 2":
				body.velocity.y = -vel2
			elif body.name == "Player 3":
				body.velocity.y = -vel3
			elif body.name == "Player 4":
				body.velocity.y = -vel4
			elif body.name == "Player 5":
				body.velocity.y = -vel5

#Blue
func _on_p_2_body_entered(body):
	if body.has_meta("Player"):
		distance = body.position.x - portal2.position.x
		body.position = portal1.position + Vector2(distance, -20)
		if body.name == "Player 1":
			body.velocity.y = -vel1
		elif body.name == "Player 2":
			body.velocity.y = -vel2
		elif body.name == "Player 3":
			body.velocity.y = -vel3
		elif body.name == "Player 4":
			body.velocity.y = -vel4
		elif body.name == "Player 5":
			body.velocity.y = -vel5

#Gets Velocity
func _on_velo_dect_body_entered(body):
	if body.has_meta("Player"):
		if body.name == "Player 1":
			vel1 = body.velocity.y
		elif body.name == "Player 2":
			vel2 = body.velocity.y
		elif body.name == "Player 3":
			vel3 = body.velocity.y
		elif body.name == "Player 4":
			vel4 = body.velocity.y
		elif body.name == "Player 5":
			vel5 = body.velocity.y
