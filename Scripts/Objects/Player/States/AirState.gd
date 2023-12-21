class_name AirState extends PlayerState


func _state_physics_process(delta: float) -> void:
	player.enable_gravity(delta)
	player.movement(delta, player.acc * 0.5)
	play_anim(delta)
	
	if player.is_on_floor():
		state_machine.current_state = state_machine.get_node("FloorState")

func play_anim(delta: float) -> void:
	player.global_anim()
	
	player.sprite.rotation_degrees.z = lerp(
		player.sprite.rotation_degrees.z,
		20.0 * -(player.velocity.x / player.acc * delta) if (player.velocity.x as int) else 0.0,
		0.1
	)
	
	player.sprite.rotation_degrees.z = clamp(player.sprite.rotation_degrees.z, -35, 35)
