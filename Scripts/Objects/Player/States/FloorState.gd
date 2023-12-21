class_name FloorState extends PlayerState


func _state_physics_process(delta: float) -> void:
	player.enable_gravity(delta)
	player.movement(delta, player.acc)
	enable_jump()
	play_anim()
	
	if !player.is_on_floor():
		state_machine.current_state = state_machine.get_node("AirState")
		player.movement_particles.emitting = false

func enable_jump() -> void:
	if Input.is_action_just_pressed("jump") && player.is_on_floor():
		player.velocity.y = player.jump_force
		
		player.sprite_mount_anim.play("jump")
		Global.spawn_cpu_particles(player.jump_particles_scene, player.jump_particles_pos.global_position)

func play_anim() -> void:
	player.global_anim()
	
	if player.get_input_dir():
		player.sprite_anim.play("movement")
		player.movement_particles.emitting = true
		return
	
	if player.sprite_anim.is_playing():
		player.sprite_anim.stop(true)
	
	player.sprite.rotation_degrees.z = lerp(player.sprite.rotation_degrees.z, 0.0, 0.1)
	player.movement_particles.emitting = false
