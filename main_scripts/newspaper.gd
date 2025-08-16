extends CanvasLayer

var mouse_inside = false
var holding_newspaper = false

var local_mouse_pos = Vector2.ZERO

func _process(_delta):
	if holding_newspaper:
		$sprite.global_position = $sprite.get_global_mouse_position() - local_mouse_pos

func _unhandled_input(event: InputEvent) -> void:
	get_viewport().set_input_as_handled()
	if mouse_inside:
		
		if event.is_action_released("wheel_up") and $sprite.scale.x < 0.40:
			$sprite.scale.x += 0.01
			$sprite.scale.y += 0.01
		if event.is_action_released("wheel_down") and $sprite.scale.x > 0.16:
			$sprite.scale.x -= 0.01
			$sprite.scale.y -= 0.01
		

func _on_pickup_button_button_down() -> void:
	holding_newspaper = true
	local_mouse_pos.x = $sprite.get_local_mouse_position().x * $sprite.scale.x
	local_mouse_pos.y = $sprite.get_local_mouse_position().y * $sprite.scale.y

func _on_pickup_button_button_up() -> void:
	holding_newspaper = false

func _on_pickup_button_mouse_entered() -> void:
	mouse_inside = true

func _on_pickup_button_mouse_exited() -> void:
	mouse_inside = false
	$sprite.scale = Vector2(0.16, 0.16)
