extends Node

var is_typing: bool = false

func growing_text(node, text: String, time: float):
	
	if is_typing:
		return
	
	is_typing = true
	node.text = ""
	for letter in text:
		node.text += letter
		await get_tree().create_timer(time).timeout
	is_typing = false
