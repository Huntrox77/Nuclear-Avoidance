extends Control
@onready var Modifier = get_node("/root/Modifiers")
@onready var Global_Text = get_node("/root/GlobalTexts")
@onready var Config = get_node("/root/ConfigScript")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Sets buttons if to what they should be.
func _process(_delta):
	$OptionButton.selected = Config.Text_Speed
	$Timer.selected = Config.In_Timer
	$HowManyPlayersLeft.selected = Config.How_Many_Players_Left_Choice
	$"UI Size".selected = Config.UI_Size
	$"Windows Size".selected = Config.Window_Mode
	pass


# gets the index and sets the config to it
func _on_option_button_item_selected(index):
	if index == 0:
		Global_Text.text_speed = 1
		Config.Text_Speed = 0
	if index == 1:
		Global_Text.text_speed = 0.03
		Config.Text_Speed = 1
	if index == 2:
		Global_Text.text_speed = 0.02
		Config.Text_Speed = 2
	if index == 3:
		Global_Text.text_speed = 0.01
		Config.Text_Speed = 3


# gets the index and sets the config to it
func _on_player_tab_tab_clicked(tab):
	if tab == 0:
		$PlayerTab/Player1ControlTab.show()
		$PlayerTab/Player2ControlTab.hide()
		$PlayerTab/Player3ControlTab.hide()
		$PlayerTab/Player4ControlTab.hide()
	elif tab == 1:
		$PlayerTab/Player1ControlTab.hide()
		$PlayerTab/Player2ControlTab.show()
		$PlayerTab/Player3ControlTab.hide()
		$PlayerTab/Player4ControlTab.hide()
	elif tab == 2:
		$PlayerTab/Player1ControlTab.hide()
		$PlayerTab/Player2ControlTab.hide()
		$PlayerTab/Player3ControlTab.show()
		$PlayerTab/Player4ControlTab.hide()
	elif tab == 3:
		$PlayerTab/Player1ControlTab.hide()
		$PlayerTab/Player2ControlTab.hide()
		$PlayerTab/Player3ControlTab.hide()
		$PlayerTab/Player4ControlTab.show()


# gets the index and sets the config to it
func _on_timer_item_selected(index):
	Modifier.In_Timer = index
	Config.In_Timer = index



# gets the index and sets the config to it
func _on_how_many_players_left_item_selected(index):
	Modifier.How_Many_Players_Left_Choice = index
	Config.How_Many_Players_Left_Choice = index


# gets the index and sets the config to it
func _on_ui_size_item_selected(index):
	Modifier.UI_Size = index
	Config.UI_Size = index


# gets the index and sets the config to it
func _on_windows_size_item_selected(index):
	Modifier.Window_Mode = index
	Config.Window_Mode = index
	if index == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif index == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


# gets the index and sets the config to it
func _on_res_item_selected(index):
	Modifier.Res = index
	Config.Res = index

