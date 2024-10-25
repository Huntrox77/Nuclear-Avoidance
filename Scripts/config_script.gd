extends Node
@onready var Modifier = get_node("/root/Modifiers")
var config = ConfigFile.new()
var player1_controls = []
var player2_controls = []
var player3_controls = []
var player4_controls = []
var player1_control_UI = []
var player2_control_UI = []
var player3_control_UI = []
var player4_control_UI = []
var Text_Speed = 0
var Favourites = []
var How_Many_Players_Left_Choice = 1
var UI_Size = 0
var Window_Mode = 0
var Res = 0
var Challenge_One_Complete = false
var Challenge_Two_Complete = false
var Challenge_Three_Complete = false
var Challenge_Four_Complete = false
var achievements = []
var In_Timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Loads the config
	config.load("res://config.cfg")
	# Settings
	Text_Speed = config.get_value("Text_Speed", "Choice", 1) 
	Favourites = config.get_value("Modifiers", "Favourited", [])
	In_Timer = config.get_value("Timer", "Choice", 1)
	How_Many_Players_Left_Choice = config.get_value("Playersleft", "Choice", 1)
	UI_Size = config.get_value("UI_Size", "Choice", 1)
	Window_Mode = config.get_value("Window_Mode", "Choice", 1)
	Res = config.get_value("Res", "Choice", 1)
	# Challenge Save
	Challenge_One_Complete = config.get_value("Achivements", "Completed", [
			false, 
			false, 
			false, 
			false,
		])[0] 
	Challenge_Two_Complete = config.get_value("Achivements", "Completed", [
			false, 
			false, 
			false, 
			false,
		])[1] 
	Challenge_Three_Complete = config.get_value("Achivements", "Completed", [
			false, 
			false, 
			false, 
			false,
		])[2]  
	Challenge_Four_Complete = config.get_value("Achivements", "Completed", [
			false, 
			false, 
			false, 
			false,
		])[3] 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# sets all the values
	config.set_value("Player1_Controls", "Controls", player1_controls)
	config.set_value("Player2_Controls", "Controls", player2_controls)
	config.set_value("Player3_Controls", "Controls", player3_controls)
	config.set_value("Player4_Controls", "Controls", player4_controls)
	achievements = [
			Challenge_One_Complete, 
			Challenge_Two_Complete, 
			Challenge_Three_Complete, 
			Challenge_Four_Complete,
		]
	config.set_value("Text_Speed", "Choice", Text_Speed) 
	config.set_value("Achivements", "Completed", achievements)
	config.set_value("Modifiers", "Favourited", Favourites)
	config.set_value("Timer", "Choice", In_Timer)
	config.set_value("Playersleft", "Choice", How_Many_Players_Left_Choice)
	config.set_value("UI_Size", "Choice", UI_Size)
	config.set_value("Window_Mode", "Choice", Window_Mode)
	config.set_value("Res", "Choice", Res)
	Modifier.Window_Mode = Window_Mode
	Modifier.In_Timer = In_Timer
	Modifier.How_Many_Players_Left_Choice = How_Many_Players_Left_Choice
	_save()



func _save():
	config.save("res://config.cfg")
