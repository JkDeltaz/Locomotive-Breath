extends RichTextLabel

var minutes = 0
var hours = 0

var am_or_pm = "am"

@onready var clock_anim = get_parent().get_node("clock_border/anim")

func _process(_delta):
	if Input.is_action_just_pressed("left_mouse"):
		print(clock_anim.current_animation)

func _on_clock_timer_timeout() -> void:
	minutes += 1
	if minutes >= 60:
		minutes = 0
		hours += 1
		Global.emit_signal("hour_passed")
		
	if hours > 12:
		if am_or_pm == "am":
			hours = 1
			am_or_pm = "pm"
		else:
			hours = 0
			am_or_pm = "am"
	
	var hour_text = str(hours) if hours >= 10 else "0"+str(hours)
	var minutes_text = str(minutes) if minutes >= 10 else "0"+str(minutes)
	update_clock(hour_text, minutes_text)

func update_clock(hour_text, minutes_text):
	if minutes%10 == 0:
		text = hour_text+":"+minutes_text


func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "dawn":
		clock_anim.play("afternoon")
	elif anim_name == "afternoon":
		clock_anim.play("night")
	else:
		clock_anim.play("dawn")
