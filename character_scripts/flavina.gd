extends characterBase

var flavina_dialogue = preload("res://dialogues/flavina.dialogue") as Resource

func _ready():
	main_offers = {"canned_cow": 100}
	main_preferences = {"can_of_motivation": 100}
	prefered_position = Vector2(486, 271)
	info = Characters.get_info("flavina")
	money = info.get("money")


func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "walk_in":
		DialogueManager.show_dialogue_balloon(load("res://dialogues/flavina.dialogue"), "start")
