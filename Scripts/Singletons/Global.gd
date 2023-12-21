extends Node


func spawn_cpu_particles(particle_scene: PackedScene, spawn_position: Vector3) -> void:
	var particle_instance := particle_scene.instantiate() as CPUParticles3D
	get_tree().current_scene.add_child(particle_instance)
	
	particle_instance.global_position = spawn_position
	particle_instance.restart()
	
	if particle_instance.one_shot:
		await particle_instance.finished
		particle_instance.queue_free()
