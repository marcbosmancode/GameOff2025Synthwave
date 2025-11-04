class_name MusicTrack
extends Node2D


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("track_4"):
		add_note(0)
	if event.is_action_pressed("track_5"):
		add_note(1)
	if event.is_action_pressed("track_6"):
		add_note(2)


func add_note(track_index: int, speed: float = 3.0) -> void:
	var track : Node = get_child(track_index)
	if track is NoteTrack:
		track.add_note(speed)
