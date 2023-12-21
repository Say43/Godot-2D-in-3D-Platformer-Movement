class_name Player extends CharacterBody3D

@export var move_speed: float
@export_range(0, 1) var acc: float

@export var gravity_force: float
@export var jump_force: float

@onready var sprite: Sprite3D = %Sprite3D
@onready var sprite_mount: Node3D = $SpriteMount
@onready var sprite_anim: AnimationPlayer = $SpriteAnim
@onready var sprite_mount_anim: AnimationPlayer = $SpriteMountAnim

var jump_particles_scene: PackedScene = preload("res://Scenes/Particles/JumpParticles.tscn")
@onready var jump_particles_pos: Marker3D = $JumpParticlesPos
@onready var movement_particles: CPUParticles3D = %MovementParticles


func get_input_dir() -> Vector2:
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

func movement(delta: float, movement_acc) -> void:
	var normalized_input_dir: Vector2 = get_input_dir().normalized()
	
	velocity.x = lerp(velocity.x, normalized_input_dir.x * move_speed * delta, movement_acc)
	velocity.z = lerp(velocity.z, normalized_input_dir.y * move_speed * delta, movement_acc)
	
	move_and_slide()

func enable_gravity(delta: float) -> void:
	velocity.y -= gravity_force * delta

func global_anim() -> void:
	sprite_mount.rotation_degrees.x = lerp(sprite_mount.rotation_degrees.x, 30 * get_input_dir().y, 0.1)
