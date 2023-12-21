class_name CustomCamera extends Camera3D

@export var player: Player
@export var acc: float


func _physics_process(_delta: float) -> void:
	follow_player()

func follow_player() -> void:
	look_at(player.global_position)
	
	global_position.x = lerp(global_position.x, player.global_position.x, acc)
	global_position.y = lerp(
		global_position.y,
		player.global_position.y + 3,
		acc
	)
