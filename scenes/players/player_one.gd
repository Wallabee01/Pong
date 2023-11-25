extends CharacterBody2D

@onready var velocity_component = $VelocityComponent


func _process(_delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity_component.accelerate_in_direction(direction)
	velocity_component.move(self)


func get_movement_vector() -> Vector2:
	var y_movement = Input.get_action_strength('player_one_move_down') - Input.get_action_strength('player_one_move_up')
	
	return Vector2(0, y_movement)
