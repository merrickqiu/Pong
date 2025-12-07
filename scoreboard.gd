extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#TODO: Use signals instead of _process
	text = "Pong!
		%d:%d" % [Globals.left_points, Globals.right_points]
