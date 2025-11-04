class_name MusicNote
extends Node2D


@onready var destroy_timer = $DestroyTimer

var origin_point : Vector2 = Vector2.ZERO
var destination_point : Vector2 = Vector2.ZERO
var move_duration : float = 3.0

var move_tween : Tween


func _ready() -> void:
	# Set the note in the correct starting position
	position = origin_point
	
	# Create a tween to move the note to the destination over time
	move_tween = create_tween()
	move_tween.tween_property(self, "position", destination_point, move_duration)
	
	# Start a timer to destroy this note
	destroy_timer.start(move_duration)


func _on_destroy_timer_timeout() -> void:
	Globals.combo = 0
	Globals.notes_missed += 1
	queue_free()
