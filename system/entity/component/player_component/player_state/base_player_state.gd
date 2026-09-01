class_name BasePlayerState extends BaseState

@export var animation_tree: AnimationTree
@export var player: CharacterBody2D
@export var ray_cast: RayCast2D

const RAY_CAST_LENGTH = 50.0

var input_direction: Vector2

func update_animation():
	animation_tree["parameters/idle/blend_position"] = input_direction
	animation_tree["parameters/conditions/is_running"] = input_direction
	animation_tree["parameters/conditions/is_walking"] = input_direction
	ray_cast.target_position = input_direction * RAY_CAST_LENGTH
