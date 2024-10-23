extends Node
@onready var Modifier = get_node("/root/Modifiers")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# kill player on enter spike
func _on_spike_body_entered(body):
	if body.has_meta("Player"):
		body.queue_free()
		Modifier.players_left -= 1
