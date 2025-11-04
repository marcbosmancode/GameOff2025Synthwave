class_name NoteTrack
extends Node2D


@export var track_id : int = 0

@onready var origin_point = $OriginPoint
@onready var destination_point = $DestinationPoint
@onready var track_line = $TrackLine
@onready var notes = $Notes

var note = preload("res://GameLogic/MusicTrack/music_note.tscn")


func _ready() -> void:
	# Create a line to visually show the track
	var line_points : Array[Vector2] = []
	
	line_points.append(origin_point.position)
	line_points.append(destination_point.position)
	
	track_line.points = PackedVector2Array(line_points)


func add_note(move_duration: float) -> void:
	var note_instance = note.instantiate()
	note_instance.move_duration = move_duration
	note_instance.destination_point = destination_point.position
	notes.add_child(note_instance)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("track_%s" % track_id):
		for instanced_note in notes.get_children():
			if instanced_note is Node:
				Globals.combo += 1
				Globals.notes_hit += 1
				instanced_note.queue_free()
				break
