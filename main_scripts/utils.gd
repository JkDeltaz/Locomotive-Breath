extends Node

var is_typing: bool = false
var transition_scene = preload("res://misc/transition.tscn")

func growing_text(node, text: String, time: float):
	
	if is_typing:
		return
	
	is_typing = true
	node.text = ""
	for letter in text:
		node.text += letter
		await get_tree().create_timer(time).timeout
	is_typing = false

func transition(type, speed_scale):
	var transition_scene_instance = transition_scene.instantiate()
	get_tree().current_scene.add_child(transition_scene_instance)
	transition_scene_instance.play(type, speed_scale)
