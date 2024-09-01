extends Control
@onready var Modifier = get_node("/root/Modifiers")
@onready var GlobalText = get_node("/root/GlobalTexts")
@onready var Config = get_node("/root/ConfigScript")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$OptionButton.selected = Config.TextSpeed
	pass

func _on_option_button_item_selected(index):
	if index == 0:
		GlobalText.textspeed = 1
		Config.TextSpeed = 0
	if index == 1:
		GlobalText.textspeed = 0.03
		Config.TextSpeed = 1
	if index == 2:
		GlobalText.textspeed = 0.02
		Config.TextSpeed = 2
	if index == 3:
		GlobalText.textspeed = 0.01
		Config.TextSpeed = 3


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
