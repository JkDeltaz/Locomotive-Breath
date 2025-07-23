extends Node
class_name characterBase


# Chave: Oferta, Valor: Raridade
var main_offers: Dictionary
var main_preferences: Dictionary
var prefered_position = Vector2()
var disliked_items: Dictionary # Item: Valor de lealdade perdido

var patience: int # Quantas vezes pode ser ofendido ou oferecido um item que não gosta.

var dealbreaker: String
var money: int

var info: Dictionary

@onready var main_scene = get_tree().current_scene
@onready var anim = $anim
@onready var talkBtn = $talkBtn

func _ready() -> void:
	talkBtn.pressed.connect(self.talk)

func get_prefered_position():
	return prefered_position

func get_main_preferences():
	if main_preferences:
		return main_preferences
	else:
		print("Erro: Preferências ainda não criadas.")

func get_disliked_item(item):
	if disliked_items.has(item):
		return disliked_items.get(item)
	else:
		return null

func get_info():
	return info

func get_patience() -> int:
	return patience

func play_animation(animation):
	anim.play(animation)

func dealbreak(item_dict: Dictionary) -> int:
	if dealbreaker == "money":
		if item_dict.get("price") >= money:
			return 100
		elif item_dict.get("price") >= money/2:
			return 50
		else:
			return 30
	return 100

func remove_loyalty(amount):
	pass

func talk():
	DialogueManager.show_dialogue_balloon(load("res://dialogues/"+get_name()+".dialogue"), "talk")
