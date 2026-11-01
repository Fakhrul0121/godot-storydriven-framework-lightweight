class_name MovingComponent extends Node

@export var animation_player: AnimationPlayer
@export var movable_entity: CharacterBody2D
@export_enum("up", "down", "left", "right") var initial_direction: String = "down"

var current_direction = initial_direction

func move_entity(direction: Vector2, speed: EntityManager.MOVEMENT_SPEED, animation: String):
	movable_entity.velocity = direction * speed
	movable_entity.move_and_slide()
	play_animation_with_direction(direction,animation)

func play_animation_with_direction(direction: Vector2, animation: String):
	if direction.x <= -0.7:
		current_direction = "up"
	elif direction.x >= 0.7:
		current_direction = "down"
	else:
		if direction.y > 0:
			current_direction = "right"
		elif direction.y < 0:
			current_direction = "left"
	animation_player.play("%s/%s" % [animation, current_direction])
