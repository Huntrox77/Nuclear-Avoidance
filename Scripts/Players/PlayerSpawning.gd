extends Node2D
@onready var Modifier = get_node("/root/Modifiers")
@onready var Players = $Players
@onready var Spawns = $"SpawnPos'"
var ChosenSpawns = []
var RaniSpawn = randi_range(1,4)
var RaniRespawn = randi_range(1,4)
var Spawning = true
var player1st
var player2nd
var player3rd
var First
var Second
var Third


# Called when the node enters the scene tree for the first time.
func _ready():
	# ThE FOG IS COMING
	Modifier.PlayerOne = $"Players/Player 1"
	Modifier.PlayerTwo = $"Players/Player 2"
	Modifier.PlayerThree = $"Players/Player 3"
	Modifier.PlayerFour = $"Players/Player 4"
	Modifier.PlayerFive = $"Players/Player 5"
	if Modifier.currentmap == "map9" or Modifier.currentmap == "map10" or Modifier.currentmap == "map12" or Modifier.currentmap == "map13":
		Modifier.LampOne = $Lamps/Lamp1
		Modifier.LampTwo = $Lamps/Lamp2
	if Modifier.currentmap == "winscreen":
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
				if ChosenSpawns.size() >= 4:
					Spawning = false
				RaniSpawn = randi_range(1,4)
				if RaniSpawn == 1:
					if not ChosenSpawns.has(0):
						i.position = Spawns.get_child(0).position
						ChosenSpawns.append(0)
					else:
						RaniSpawn = randi_range(1,4)
				if RaniSpawn == 2:
					if not ChosenSpawns.has(1):
						i.position = Spawns.get_child(1).position
						ChosenSpawns.append(1)
					else:
						RaniSpawn = randi_range(1,4)
				if RaniSpawn == 3:
					if not ChosenSpawns.has(2):
						i.position = Spawns.get_child(2).position
						ChosenSpawns.append(2)
					else:
						RaniSpawn = randi_range(1,4)
				if RaniSpawn == 4:
					if not ChosenSpawns.has(3):
						i.position = Spawns.get_child(3).position
						ChosenSpawns.append(3)
					else:
						RaniSpawn = randi_range(1,4)
	
	if Modifier.currentmap == "winscreen":
		var Points = [[Modifier.P1Points, Modifier.PlayerOne],[Modifier.P2Points, Modifier.PlayerTwo],[Modifier.P3Points, Modifier.PlayerThree],[Modifier.P4Points, Modifier.PlayerFour]]
		Points.sort_custom(compare)
		for i in 4:
			Points[i][1].position = Spawns.get_child(i).position
			if i == 0:
				player1st = Points[i][1]
			if i == 1:
				player2nd = Points[i][1]
			if i == 2:
				player3rd = Points[i][1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Modifier.currentmap == "winscreen":
		if Modifier.playersleft > 0:
			First.global_position.x = player1st.global_position.x
			First.global_position.y = player1st.global_position.y - 64
			if Modifier.playersleft > 1:
				Second.global_position.x = player2nd.global_position.x
				Second.global_position.y = player2nd.global_position.y - 64
				if Modifier.playersleft > 2:
					Third.global_position.x = player3rd.global_position.x
					Third.global_position.y = player3rd.global_position.y - 64
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


func compare(a,b):
	if a[0] > b[0]:
		return true
	return false
