extends Node2D
#signal swipe

var swipe_start = null
var minimum_drag = 100
var direction = "left"
var depth = "back"

func _unhandled_input(event):
	if event.is_action_pressed("click"):
		swipe_start = get_viewport().get_mouse_position()
	if event.is_action_released("click"):
		_calculate_swipe(get_viewport().get_mouse_position())
		
func _calculate_swipe(swipe_end):
	if swipe_start == null: 
		return
	var swipe = swipe_end - swipe_start
	#print(swipe)
	if abs(swipe.x) > minimum_drag:
		if swipe.x > 0:
			direction = "right"
			#print("right")
			#emit_signal("swipe", "right")
		else:
			direction = "left"
		if swipe.y > 0:
			depth = "front" 	
		elif swipe.y <= 0:
			depth = "back" 
			
			#print("left")
		   # emit_signal("swipe", "left")
