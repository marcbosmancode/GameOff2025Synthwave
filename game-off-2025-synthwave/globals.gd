extends Node


signal combo_changed
signal notes_hit_changed
signal notes_missed_changed


#region Music track statistics

var combo : int = 0:
	set(new_value):
		combo = new_value
		combo_changed.emit(new_value)
var notes_hit : int = 0:
	set(new_value):
		notes_hit = new_value
		notes_hit_changed.emit(new_value)
var notes_missed : int = 0:
	set(new_value):
		notes_missed = new_value
		notes_missed_changed.emit(new_value)

#endregion
