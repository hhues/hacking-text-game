extends CanvasLayer

const CHAR_READ_RATE = 0.025

onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
onready var textedit = $TextboxContainer/MarginContainer/HBoxContainer/TextEdit

export (Array, String, MULTILINE) var text123

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.FINISHED

var text_queue = []

var current_line = 0

func _ready():
	print("Starting state: State.READY")
	for current_line in 8:
		queue_text(text123[current_line])

func _process(delta):
	var sizeOfLabel = label.rect_size.y
	textedit.rect_position.y = -300 + sizeOfLabel*2
	match current_state:
		State.READY:
			if !text_queue.empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				label.percent_visible = 1.0
				$Tween.remove_all()
				change_state(State.FINISHED)
		State.FINISHED:
			pass

func queue_text(next_text):
	text_queue.push_back(next_text)

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.percent_visible = 0.0
	change_state(State.READING)
	$Tween.interpolate_property(label, "percent_visible", 0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")

func _on_Tween_tween_completed(object, key):
	change_state(State.FINISHED)
	print("test")
	print(text_queue)
	if len(text_queue) == 7:
		console_next()
	else:
		console_finished()

func console_start():
	current_state = State.READY

func console_input_check(answer):
	$Node2D.console_input_check(answer)
	
func console_success():
	print("user was correct")

# calls the next lines of text for the console
func console_next():
	match current_state:
		State.READY:
			pass
		State.READING:
			pass
		State.FINISHED:
			change_state(State.READY)
			pass

# when the user gets a failure input
func console_fail():
	pass

# when the console finishes its print that doesn't involve a user input
func console_finished():
	print("console finished")
	$"../..".next_dialogue()


# when the user beats the game
func console_shutdown():
	print("console shutdown")
	current_state = State.FINISHED
