extends Node2D
@onready var Modifier = get_node("/root/Modifiers")
@onready var Players = $Players
@onready var Spawns = $"SpawnPos'"
var Chosen_Spawns = []
var Randi_Spawn = randi_range(1,4)
var Randi_Respawn = randi_range(1,4)
var Spawning = true
var player_1st
var player_2nd
var player_3rd
var First
var Second
var Third


# Called when the node enters the scene tree for the first time.
func _ready():
	# ThE FOG IS COMING
	Modifier.Player_One = $"Players/Player 1"
	Modifier.Player_Two = $"Players/Player 2"
	Modifier.Player_Three = $"Players/Player 3"
	Modifier.Player_Four = $"Players/Player 4"
	Modifier.Player_Five = $"Players/Player 5"
	if (
			Modifier.current_map == "map9"
			or Modifier.current_map == "map10" 
			or Modifier.current_map == "map12" 
			or Modifier.current_map == "map13"
	):
		Modifier.Lamp_One = $Lamps/Lamp1
		Modifier.Lamp_Two = $Lamps/Lamp2
	if Modifier.current_map == "winscreen":
		First = $"Grounds/Ground1/1St"
		Second = $"Grounds/Ground2/2Nd"
		Third = $"Grounds/Ground3/3Rd"
	#Random Spawn
	while Spawning == true:
		for i in Players.get_children():
			if i.name == "Player 5":
				i.position = Spawns.get_child(0).position
				i.position.y -=100
			else:
				if Chosen_Spawns.size() >= 4:
					Spawning = false
				Randi_Spawn = randi_range(1,4)
				if Randi_Spawn == 1:
					if not Chosen_Spawns.has(0):
						i.position = Spawns.get_child(0).position
						Chosen_Spawns.append(0)
					else:
						Randi_Spawn = randi_range(1,4)
				if Randi_Spawn == 2:
					if not Chosen_Spawns.has(1):
						i.position = Spawns.get_child(1).position
						Chosen_Spawns.append(1)
					else:
						Randi_Spawn = randi_range(1,4)
				if Randi_Spawn == 3:
					if not Chosen_Spawns.has(2):
						i.position = Spawns.get_child(2).position
						Chosen_Spawns.append(2)
					else:
						Randi_Spawn = randi_range(1,4)
				if Randi_Spawn == 4:
					if not Chosen_Spawns.has(3):
						i.position = Spawns.get_child(3).position
						Chosen_Spawns.append(3)
					else:
						Randi_Spawn = randi_range(1,4)
	
	# Give players their placings on the winscreen via a array being rearragnged and checked.
	if Modifier.current_map == "winscreen":
		var Points = [
				[Modifier.P1_Points, Modifier.Player_One],
				[Modifier.P2_Points, Modifier.Player_Two],
				[Modifier.P3_Points, Modifier.Player_Three],
				[Modifier.P4_Points, Modifier.Player_Four],
		]
		Points.sort_custom(compare)
		for i in 4:
			Points[i][1].position = Spawns.get_child(i).position
			if i == 0:
				player_1st = Points[i][1]
			if i == 1:
				player_2nd = Points[i][1]
			if i == 2:
				player_3rd = Points[i][1]


# Gets the players points to decide where people spawn in the winscreen
func _process(_delta):
	if Modifier.current_map == "winscreen":
		if Modifier.players_left > 0:
			First.global_position.x = player_1st.global_position.x
			First.global_position.y = player_1st.global_position.y - 64
			if Modifier.players_left > 1:
				Second.global_position.x = player_2nd.global_position.x
				Second.global_position.y = player_2nd.global_position.y - 64
				if Modifier.players_left > 2:
					Third.global_position.x = player_3rd.global_position.x
					Third.global_position.y = player_3rd.global_position.y - 64
	# If player super far away, teleport them back :) 
	for i in Players.get_children():
		if i.position.y <= -5000:
			if i.name == "Player 1":
				i.position = Vector2(0, -150)
				i.velocity = Vector2(0, 0)
			elif i.name == "Player 2":
				i.position = Vector2(0, -250)
				i.velocity = Vector2(0, 0)
			elif i.name == "Player 3":
				i.position = Vector2(0, -350)
				i.velocity = Vector2(0, 0)
			elif i.name == "Player 4":
				i.position = Vector2(0, -450)
				i.velocity = Vector2(0, 0)


#Something idk
func compare(a,b):
	if a[0] > b[0]:
		return true
	return false
