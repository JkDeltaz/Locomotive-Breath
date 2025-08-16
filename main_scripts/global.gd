extends Node

signal hour_passed
signal day_ended
signal start_trading

var reputation: int = 0
var current_hour: int = 9

var day_ended_transition = false

func next_hour():
	if current_hour < 21:
		emit_signal("hour_passed")
	else:
		end_day()

func set_current_hour(hours):
	current_hour = hours

func end_day():
	emit_signal("day_ended")
	get_tree().change_scene_to_file("res://main_scenes/home.tscn")
