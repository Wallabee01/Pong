extends RigidBody2D

@onready var random_sfx_component = $RandomSFXComponent
@onready var area_2d = $Area2D


func _ready():
	area_2d.connect("body_entered", on_body_entered)


func on_body_entered(_body: Node):
	random_sfx_component.play_random()
