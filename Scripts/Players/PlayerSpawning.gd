extends Node2D
@onready var Modifier = get_node("/root/Modifiers")
@onready var Players = $Players
@onready var Spawns = $"SpawnPos'"
var ChosenSpawns = []
var RaniSpawn = randi_range(1,4)
var RaniRespawn = randi_range(1,4)
var Spawning = true


# Called when the node enters the scene tree for the first time.
func _ready():
	# ThE FOG IS COMING
	Modifier.PlayerOne = $"Players/Player 1"
	Modifier.PlayerTwo = $"Players/Player 2"
	Modifier.PlayerThree = $"Players/Player 3"
	Modifier.PlayerFour = $"Players/Player 4"
	Modifier.PlayerFive = $"Players/Player 5"
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
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
