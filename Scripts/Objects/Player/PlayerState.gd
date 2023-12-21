class_name PlayerState extends Node

signal state_selected(last_state: PlayerState)

var player: Player
var state_machine: PlayerStateMachine


func _state_process(delta: float) -> void:
	pass

func _state_physics_process(delta: float) -> void:
	pass

func _state_input(event: InputEvent) -> void:
	pass

func _state_unhandled_input(event: InputEvent) -> void:
	pass
