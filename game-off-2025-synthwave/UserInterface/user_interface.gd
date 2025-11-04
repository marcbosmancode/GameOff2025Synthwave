extends CanvasLayer


@onready var combo_label = $ComboLabel
@onready var note_hit_label = $NoteHitLabel

var bounce_tween : Tween


func _ready() -> void:
	Globals.combo_changed.connect(_on_combo_changed)
	Globals.notes_hit_changed.connect(_on_notes_hit_changed)


func _on_combo_changed(new_value: int) -> void:
	combo_label.text = "combo %s" % new_value


func _on_notes_hit_changed(_new_value: int) -> void:
	# Stop old tween if it is still running
	if bounce_tween is Tween:
		bounce_tween.kill()
	
	bounce_tween = create_tween().set_parallel()
	
	# Set starting values for the animation
	var note_hit_label_scale = randf_range(1.2, 1.5)
	note_hit_label.scale = Vector2(note_hit_label_scale, note_hit_label_scale)
	note_hit_label.rotation_degrees = randf_range(-20, 20)
	note_hit_label.modulate.a = 1.0
	
	bounce_tween.tween_property(note_hit_label, "scale", Vector2(1, 1), 0.2).set_trans(Tween.TRANS_BOUNCE)
	bounce_tween.tween_property(note_hit_label, "rotation_degrees", 0, 0.2).set_trans(Tween.TRANS_BOUNCE)
	bounce_tween.tween_property(note_hit_label, "modulate:a", 0, 0.5).set_trans(Tween.TRANS_LINEAR)
