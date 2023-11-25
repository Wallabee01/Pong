extends Area2D

signal goal_scored(goal_name: String)


func _ready():
	connect("body_entered", on_body_entered)


func on_body_entered(_body: Node2D):
	goal_scored.emit(name)
