extends Camera2D

var moving_up = false
var moving_down = false


func _process(_delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_dialogue_balloon(load("res://dialogues/purple.dialogue"), "start")
	
	if Input.is_action_just_released("wheel_down"):
		position.y += 60 if position.y < 540 else 0
	elif Input.is_action_just_released("wheel_up"):
		position.y -= 60 if position.y > 270 else 0
