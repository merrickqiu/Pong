extends Area2D

const INITIAL_SPEED = 400
const RADIUS =  10
@export var initial_position_x: float = 0.5
@export var initial_position_y: float = 0.5
var _speed
var direction


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = Vector2.LEFT
	reset()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += _speed * direction * delta
	
func reset():
	_speed = INITIAL_SPEED
	# center the left player
	position.x = Globals.screen_x*initial_position_x
	position.y = Globals.screen_y*initial_position_y
	
	
func _on_area_entered(area: Area2D) -> void:
	$AudioStreamPlayer2D.play()
	if area.name == "LeftGoal":
		direction = Vector2.RIGHT
		Globals.right_points += 1
		reset()
	elif area.name == "RightGoal":
		Globals.left_points += 1
		direction = Vector2.LEFT
		reset()
	else:
		direction = area.collision(direction)
	# print("(%d, %d)" % [Globals.left_points, Globals.right_points])
