extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass


func h_visible():
	if $H.visible == false:
		$H.visible = true
	elif $H.visible == true:
		$H.visible = false

func q_visible():
	if $Q.visible == false:
		$Q.visible = true
	elif $Q.visible == true:
		$Q.visible = false

func gm_visible():
	if $Grandma.visible == false:
		$Grandma.visible = true
	elif $Grandma.visible == true:
		$Grandma.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
