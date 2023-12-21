class_name PlayerStateMachine extends Node

@export var player: Player
@export var current_state: PlayerState: 
	set(state):
		assert(state in get_children() || !state)

		state.emit_signal("state_selected", current_state)
		
		current_state = state


func _ready() -> void:
	for state: PlayerState in get_children():
		state.player = player
		state.state_machine = self
		
		if state == current_state:
			state.emit_signal("state_selected", current_state)
			current_state = state

func _process(delta: float) -> void:
	if current_state:
		current_state._state_process(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state._state_physics_process(delta)

func _input(event: InputEvent) -> void:
	if current_state:
		current_state._state_input(event)

func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state._state_unhandled_input(event)
