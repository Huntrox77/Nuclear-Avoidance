extends TabBar
@onready var Config = get_node("/root/ConfigScript")
var awaiting_input = false
var target = "lol"
var target_UI


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _input(event):
	if awaiting_input and event is InputEventKey:
		if event.is_pressed():
			InputMap.action_erase_events(target)
			InputMap.action_add_event(target, event)
			target_UI.text = event.as_text().to_lower()
			awaiting_input = false


func _on_left_pressed():
	target = "p1-left"
	awaiting_input = true
	$Player1ControlTab/Controls/Left.text = "Awaiting Input"
	target_UI = $Player1ControlTab/Controls/Left


func _on_right_pressed():
	target = "p1-right"
	awaiting_input = true
	$Player1ControlTab/Controls/Right.text = "Awaiting Input"
	target_UI = $Player1ControlTab/Controls/Right


func _on_jump_pressed():
	target = "p1-jump"
	awaiting_input = true
	$Player1ControlTab/Controls/Jump.text = "Awaiting Input"
	target_UI = $Player1ControlTab/Controls/Jump


func _on_special_pressed():
	target = "p1-down"
	awaiting_input = true
	$Player1ControlTab/Controls/Special.text = "Awaiting Input"
	target_UI = $Player1ControlTab/Controls/Special


func _on_jump_2_pressed():
	target = "p2-jump"
	awaiting_input = true
	$Player2ControlTab/Controls/Jump2.text = "Awaiting Input"
	target_UI = $Player2ControlTab/Controls/Jump2


func _on_left_2_pressed():
	target = "p2-left"
	awaiting_input = true
	$Player2ControlTab/Controls/Left2.text = "Awaiting Input"
	target_UI = $Player2ControlTab/Controls/Left2


func _on_special_2_pressed():
	target = "p2-down"
	awaiting_input = true
	$Player2ControlTab/Controls/Special2.text = "Awaiting Input"
	target_UI = $Player2ControlTab/Controls/Special2


func _on_right_2_pressed():
	target = "p2-right"
	awaiting_input = true
	$Player2ControlTab/Controls/Right2.text = "Awaiting Input"
	target_UI = $Player2ControlTab/Controls/Right2


func _on_jump_3_pressed():
	target = "p3-jump"
	awaiting_input = true
	$Player3ControlTab/Controls/Jump3.text = "Awaiting Input"
	target_UI = $Player3ControlTab/Controls/Jump3


func _on_left_3_pressed():
	target = "p3-left"
	awaiting_input = true
	$Player3ControlTab/Controls/Left3.text = "Awaiting Input"
	target_UI = $Player3ControlTab/Controls/Left3


func _on_special_3_pressed():
	target = "p3-down"
	awaiting_input = true
	$Player3ControlTab/Controls/Special3.text = "Awaiting Input"
	target_UI = $Player3ControlTab/Controls/Special3


func _on_right_3_pressed():
	target = "p3-right"
	awaiting_input = true
	$Player3ControlTab/Controls/Right3.text = "Awaiting Input"
	target_UI = $Player3ControlTab/Controls/Right3


func _on_jump_4_pressed():
	target = "p4-jump"
	awaiting_input = true
	$Player4ControlTab/Controls/Jump4.text = "Awaiting Input"
	target_UI = $Player4ControlTab/Controls/Jump4


func _on_left_4_pressed():
	target = "p4-left"
	awaiting_input = true
	$Player4ControlTab/Controls/Left4.text = "Awaiting Input"
	target_UI = $Player4ControlTab/Controls/Left4


func _on_special_4_pressed():
	target = "p4-down"
	awaiting_input = true
	$Player4ControlTab/Controls/Special4.text = "Awaiting Input"
	target_UI = $Player4ControlTab/Controls/Special4


func _on_right_4_pressed():
	target = "p4-right"
	awaiting_input = true
	$Player4ControlTab/Controls/Right4.text = "Awaiting Input"
	target_UI = $Player4ControlTab/Controls/Right4
