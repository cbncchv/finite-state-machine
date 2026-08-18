## A subclass of [FiniteStateMachine] that utilizes [Timer].
class_name TimedFiniteStateMachine
extends FiniteStateMachine


@export var timer: Timer ## A [Timer] is required for this state machine to work!


func _ready() -> void:
	
	if !timer:
		push_error(self.name, ': Cannot find class Timer')
	
	# run _ready() from the normal state machine first...
	super()

	# timer specific settings
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)

## Start the [Timer] countdown based on the amount of [param duration]
func start_timer(duration: float) -> void:
	timer.start(duration)

## Continue the [Timer] countdown where it has left off.
func continue_timer() -> void:
	timer.paused = false

## Pause the [Timer] countdown.
func pause_timer() -> void:
	timer.paused = true

## Stop the [Timer] countdown entirely.
func stop_timer() -> void:
	timer.stop()

## Triggers when the [Timer] sends the [signal Timer.timeout] signal.
func _on_timer_timeout() -> void:
	if current_state:
		current_state.on_timeout()
