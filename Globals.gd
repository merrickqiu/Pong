extends Node2D

var screen_x
var screen_y 
var left_points = 0
var right_points = 0
func _ready() -> void:
	screen_x = get_viewport_rect().size.x
	screen_y = get_viewport_rect().size.y
