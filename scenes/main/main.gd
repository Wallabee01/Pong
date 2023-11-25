extends Node

@export var left_goal: Area2D
@export var right_goal: Area2D

@onready var player_one_score_label = $Control/HBoxContainer/PlayerOneScore
@onready var player_two_score_label = $Control/HBoxContainer/PlayerTwoScore
@onready var start_label = $Control/StartLabel

@onready var ball = $Ball

@onready var player_one_scored_audio_component = $PlayerOneScoredAudioComponent
@onready var player_two_scored_audio_component = $PlayerTwoScoredAudioComponent

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


func _unhandled_input(_event):
	if Input.is_action_just_pressed('start') && game_not_started:
		ball.linear_velocity.x = ball_start_velocity_x
		game_not_started = false
		start_label.visible = false
		get_tree().root.set_input_as_handled()

func on_goal_scored(goal_name: String):
	if goal_name == 'LeftGoal':
		player_two_score += 1
		player_two_score_label.text = '%02d' % player_two_score
		player_two_scored_audio_component.play_random()
		reset()
	if goal_name == 'RightGoal':
		player_one_score += 1
		player_one_score_label.text = '%02d' % player_one_score
		player_one_scored_audio_component.play_random()
		reset()


func reset():
	var timer = get_tree().create_timer(0.1)
	await timer.timeout
	ball.linear_velocity = Vector2(0,0)
	ball.global_position = ball_start_position
	start_label.visible = true
	game_not_started = true
