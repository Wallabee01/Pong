extends RigidBody2D

@onready var audio_stream_player = $AudioStreamPlayer


func _ready():
	connect('body_entered', on_body_entered)


func on_body_entered(body: Node):
	audio_stream_player.play()
