extends RichTextLabel
@onready var GlobalText = get_node("/root/GlobalTexts")
@onready var Modifier = get_node("/root/Modifiers")
var Vis = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Vis = GlobalText.ChallengeTextVis
	visible_ratio = Vis
	text = GlobalText.ChallengeText
