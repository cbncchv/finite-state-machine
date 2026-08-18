## A state machine. Manages transitions between [State] based on conditions.
class_name FiniteStateMachine
extends Node

## The state it should start on the very start. (set up with [code]_ready()[/code])
@export var initial_state: State

var current_state: State ## Set the current state.
var states: Dictionary = {} ## Stores the currently available states into a dictionary.

func _ready() -> void:
	# collect all state nodes inside this state machine
	for state in get_children():
		if state is State:
			states[state.name.to_lower()] = state # assign the state into the states dictionary
			state.state_machine = self # the 'self' represents this class
	
	# set up the starting state
	if initial_state:
		current_state = initial_state
		current_state.enter()
		
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

## Transitions from the current [State] to a new one.
func change_state(new_state: State) -> void:
	# check if the new state is the same as current state
	if !new_state or current_state == new_state:
		return
	
	current_state.exit()
	current_state = new_state
	current_state.enter()

## Find a [State] from the [member states] dictionary based on the given name ([String]).
## [br]
## Returns a [State].
func get_state(state_name: String) -> State:
	# find the state inside the dictionary, and convert it to lowercase
	var state: State = states.get(state_name.to_lower())

	# validation, make sure they exist as valid State and a child of the state machine!
	if state == null:
		push_warning(
		self.name, ": State '%s' does not exist." % state_name
		)
		return null

	return state
