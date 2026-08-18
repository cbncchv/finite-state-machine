## A state class. It is used to control modes and behaviors of something, managed by [FiniteStateMachine].
class_name State
extends Node


## The state machine that collects, controls, and manages [State].
var state_machine: FiniteStateMachine = null

## Do something when entering the [State].
func enter() -> void:
	pass
	
## Do something when exiting the [State].
func exit() -> void:
	pass
	
## Do something every frame during this [State]. (suited for [code]_process()[/code])
func update(_delta: float) -> void:
	pass
	
## Do something every fixed frame during this [State]. (suited for [code]_physics_process()[/code])
func physics_update(_delta: float) -> void:
	pass
