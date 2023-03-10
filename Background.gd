extends PanelContainer

func _ready():
	$Rows/Textbox._ready()

func _process(delta):
	$Rows/Textbox._process(delta)

func queue_text(next_text):
	$Rows/Textbox.queue_text(next_text)

func hide_textbox():
	$Rows/Textbox.hide_textbox()

func show_textbox():
	$Rows/Textbox.show_textbox()

func display_text():
	$Rows/Textbox.display_text()

func change_state(next_state):
	$Rows/Textbox.change_state(next_state)

func _on_Tween_tween_completed(object, key):
	$Rows/Textbox._on_Tween_tween_completed(object, key)

func console_start():
	$Rows/Textbox.console_start()

func console_success():
	$Rows/Textbox.console_success()

# calls the next lines of text for the console
func console_next():
	$Rows/Textbox.console_next()

# when the user gets a failure input
func console_fail():
	$Rows/Textbox.console_fail()

func next_dialogue():
	print("console finished")
	$"..".next_dialogue()
