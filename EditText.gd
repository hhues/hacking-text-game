extends TextEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var textBox = $Background/Rows/EditText

# Called when the node enters the scene tree for the first time.
func _ready():
	editText()

func editText():
	textBox.text = 'testing further 123 awwwwww\n eeeeeeeeee/n eeee'
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
