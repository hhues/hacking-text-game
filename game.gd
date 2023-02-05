extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogue = preload("res://dialogues/talking.tres")
	show_dialogue("job_description", dialogue)
	$Characters.h_visible()
	$Characters.q_visible()
	$Characters.gm_visible()
	$Phone.visible = false
	$MagnifyingGlass.visible = false

func show_dialogue(title: String, local_resource: DialogueResource = null, extra_game_states: Array = []) -> void:
	var dialogue_line = yield(DialogueManager.get_next_dialogue_line(title, local_resource, extra_game_states), "completed")
	if dialogue_line != null:
		var balloon = preload("res://dialogues/dialogue_balloon/balloon.tscn").instance()
		balloon.dialogue_line = dialogue_line
		get_tree().current_scene.add_child(balloon)
		show_dialogue(yield(balloon, "actioned"), local_resource, extra_game_states)

func h_visible():
	$Characters.h_visible()

func q_visible():
	$Characters.q_visible()
	
func gm_visible():
	$Characters.gm_visible()
	
func life_report_visible():
	$AnimationPlayer.play("initial_life_docu")
	
func show_phone():
	$Phone.visible = true

func show_magnifying_glass():
	$MagnifyingGlass.visible = true

func _on_MagnifyingGlass_pressed():
	$Flowers.change_flowers()

func _on_Phone_pressed():
	var life_docu_highlighted = $LifeDocu.highlighted_text()
	var purchases_highlighted = $FoodPurchases.highlighted_text()
	print($LifeDocu.highlighted_text())
