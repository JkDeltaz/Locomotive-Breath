extends Camera2D

var moving_up = false
var moving_down = false

var mouse_inside = false

var can_move = true

func _process(_delta):
	if Input.is_action_just_released("wheel_down") and can_move:
		position.y += 60 if position.y < 540 else 0
	elif Input.is_action_just_released("wheel_up") or mouse_inside and can_move:
		position.y -= 60 if position.y > 270 else 0


func _on_go_up_mouse_entered() -> void:
	mouse_inside = true

func _on_go_up_mouse_exited() -> void:
	mouse_inside = false
