extends Node2D

#LeverStates
enum LeverState {
	IDLE,
	PULLING_DOWN,
	PULLING_UP
}
var current_state: LeverState = LeverState.IDLE


#RNG Timing Variables
@export var min_pull_time : float = 0.5
@export var max_pull_time : float = 2.5
@export var pull_up_time : float = 1.0

#Signal to cleanly notify fortune wheel
signal fortune_wheel_started

func on_start_pulling() -> void:
	if current_state == LeverState.IDLE:
		_start_pull_down()

func _start_pull_down() -> void:
	current_state = LeverState.PULLING_DOWN
	print("pull down")
	
	#generate the random duration for the pull time between x and y
	var pull_duration = randf_range(min_pull_time, max_pull_time)
	
	#create the tween to handle the timing
	var tween = create_tween()
	tween.tween_callback(_on_pulldown_finished)
	
func _on_pulldown_finished() -> void:
	print("finished pull down")
	fortune_wheel_started.emit()
	
	#trigger the lever pull up
	
	_start_lever_auto_pull_up()
	
func _start_lever_auto_pull_up() -> void:
	print("Pull up")
	current_state = LeverState.PULLING_UP
	
	var tween = create_tween()
	tween.tween_callback(_on_pulling_up_over)
	
func _on_pulling_up_over() -> void:
	print("Finished PullUp")
	current_state = LeverState.IDLE	
