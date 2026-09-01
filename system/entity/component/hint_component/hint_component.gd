class_name HintComponent extends Area2D

@export var hint_texture: Sprite2D

@export var event_trigger_component: EventTriggerComponent

func _ready():
	if event_trigger_component != null:
		event_trigger_component.event_executed.connect(hide_hint)
	


func show_hint():
	# USE TWEEN TO ANIMATE SHOW HINT HERE
	var tween = create_tween()
	# USE OFFSET INSTEAD OF POSITION TO EASE ANIMATION
	
	pass

func idle_hint():
	# USE TWEEN TO ANIMATE IDLE HINT HERE
	var tween = create_tween()
	# USE OFFSET INSTEAD OF POSITION TO EASE ANIMATION
	
	pass

func hide_hint():
	# USE TWEEN TO ANIMATE HIDE HINT HERE
	var tween = create_tween()
	# USE OFFSET INSTEAD OF POSITION TO EASE ANIMATION
	
	pass
