extends TabBar
@onready var Config = get_node("/root/ConfigScript")
var player1con = [KEY_A, KEY_D, KEY_W, KEY_S]
var player2con = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN]
var player3con = [KEY_J, KEY_K, KEY_I, KEY_K]
var player4con = [KEY_F, KEY_H, KEY_T, KEY_G]
var p1lefton = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $Player1ControlTab.current_tab == 0:
		Config.player1con = player1con
	elif $Player1ControlTab.current_tab == 1:
		Config.player1con = ["Controller1"]
	elif $Player1ControlTab.current_tab == 2:
		Config.player1con = ["Controller1"]
	elif $Player1ControlTab.current_tab == 3:
		Config.player1con = ["Controller3"]
