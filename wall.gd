extends Area2D

func collision(direction: Vector2) -> Vector2:
	return Vector2(direction.x, -1*direction.y)
