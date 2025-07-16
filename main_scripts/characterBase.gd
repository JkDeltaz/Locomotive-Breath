extends Node
class_name characterBase


# Chave: Oferta, Valor: Raridade
var main_offers: Dictionary
var main_preferences: Dictionary
var prefered_position = Vector2()

var info: Dictionary

@onready var main_scene = get_tree().current_scene
@onready var anim = get_node("anim")

func get_prefered_position():
	return prefered_position

func get_main_preferences():
	if main_preferences:
		return main_preferences
	else:
		print("Erro: Preferências ainda não criadas.")

func get_info():
	return info

func play_animation(animation):
	anim.play(animation)
