extends Area2D

const SPEED = 200
const HALF_WIDTH =  25
const HALF_HEIGHT = 100
var _up 
var _down
@export var initial_position_x: float = 0.1
@export var initial_position_y: float = 0.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_up = String(name).to_lower() + "_up"
	_down = String(name).to_lower() + "_down"

	# center the left player
	position.x = Globals.screen_x*initial_position_x
	position.y = Globals.screen_y*initial_position_y
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	position.y = clamp(position.y + input*SPEED*delta, HALF_HEIGHT, Globals.screen_y - HALF_HEIGHT)
	
func collision(direction: Vector2) -> Vector2:
	return Vector2(-1*direction.x, direction.y+randf_range(-1.0, 1.0))
