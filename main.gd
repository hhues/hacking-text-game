extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var resource = preload("res://dialogues/talking.tres")
	show_dialogue(
		"job_description",
		resource
	)
	
func show_dialogue(title: String, local_resource: DialogueResource = null, extra_game_states: Array = []) -> void:
	var dialogue_line = yield(DialogueManager.get_next_dialogue_line(title, local_resource, extra_game_states), "completed")
	if dialogue_line != null:
		var balloon = preload("res://dialogues/dialogue_balloon/balloon.tscn").instance()
		balloon.dialogue_line = dialogue_line
		get_tree().current_scene.add_child(balloon)
		show_dialogue(yield(balloon, "actioned"), local_resource, extra_game_states)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
