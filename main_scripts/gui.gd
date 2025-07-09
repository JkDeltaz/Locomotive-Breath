extends CanvasLayer

var minutes = 0
var hours = 0


func _on_clock_timer_timeout() -> void:
	minutes += 1
	if minutes >= 60:
		minutes = 0
		hours += 1
		Global.emit_signal("hour_passed")
	
	var hour_text = str(hours) if hours >= 10 else "0"+str(hours)
	var minutes_text = str(minutes) if minutes >= 10 else "0"+str(minutes)
	update_clock(hour_text, minutes_text)

func update_clock(hour_text, minutes_text):
	if minutes%10 == 0:
		$clock.text = hour_text+":"+minutes_text


func _on_open_btn_pressed() -> void:
	pass # Replace with function body.
