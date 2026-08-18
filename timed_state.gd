## A sub-class of [State] that supports the use of [Timer].
class_name TimedState
extends State


@export var timer: Timer
@export var duration: float = 1.0


func _ready() -> void:
	if !timer:
		push_error(self.name, ': Cannot find class Timer')
	
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)

func start_timer() -> void:
	timer.start(duration)
	
func pause_timer() -> void:
	timer.paused = true
	
func continue_timer() -> void:
	timer.paused = false
	
func stop_timer() -> void:
	timer.stop()

## Runs when a [Timer] triggers the [signal Timer.timeout] signal.
func _on_timer_timeout() -> void:
	on_timeout()

## Things to do when [method _on_timer_timeout] is triggered.
func on_timeout() -> void:
	pass
