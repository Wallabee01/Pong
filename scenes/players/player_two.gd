extends CharacterBody2D

@export var ball: Node2D

@onready var velocity_component = $VelocityComponent

var range: int = 180


func _process(delta):
	if ball.global_position.x > range:
		var direction_y = ball.global_position.y
		var normalized_direction
		if direction_y < global_position.y:
			normalized_direction = Vector2(0,-1)
		else:
			normalized_direction = Vector2(0,1)
		
		velocity_component.accelerate_in_direction(normalized_direction.normalized())
	else:
		velocity_component.decelerate()
	
	velocity_component.move(self)
