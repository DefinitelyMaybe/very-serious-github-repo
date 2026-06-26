extends Node

@export var curtains: CurtainSystem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curtains.open_full()
	MusicPlayer.play_track(MusicPlayer.STAGE_MUSIC)
	$"DialogueText".start_next_dialog()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _exit_tree() -> void:
	MusicPlayer.stop_track(2.0)
