extends Node

@export var left_goal: Area2D
@export var right_goal: Area2D

@onready var player_one_score_label = $Control/HBoxContainer/PlayerOneScore
@onready var player_two_score_label = $Control/HBoxContainer/PlayerTwoScore
@onready var ball = $Ball

var player_one_score: int = 0
var player_two_score: int = 0

var ball_start_position = Vector2(304,160)
var ball_start_velocity_x = -200
var game_not_started: bool = true


func _ready():
	left_goal.connect('goal_scored', on_goal_scored)
	right_goal.connect('goal_scored', on_goal_scored)
	
	player_one_score_label.text = '%02d' % player_one_score
	player_two_score_label.text = '%02d' % player_two_score


func _unhandled_input(event):
	if Input.is_action_just_pressed('start') && game_not_started:
		ball.linear_velocity.x = ball_start_velocity_x
		game_not_started = false
	
	#Set input handled

func on_goal_scored(goal_name: String):
	if goal_name == 'LeftGoal':
		player_two_score += 1
		player_two_score_label.text = '%02d' % player_two_score
		#Play score sound
		reset()
	if goal_name == 'RightGoal':
		player_one_score += 1
		player_one_score_label.text = '%02d' % player_one_score
		#Play score sound
		reset()


func reset():
	print(ball.global_position)
	ball.global_position = ball_start_position
	print(ball.global_position)
	ball.linear_velocity = Vector2(0,0)
	game_not_started = true
