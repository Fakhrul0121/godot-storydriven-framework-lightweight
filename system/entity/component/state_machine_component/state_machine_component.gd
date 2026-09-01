class_name StateMachineComponent extends Node

@export var initial_state: BaseState

var current_state: BaseState

func _ready() -> void:
	_switch_state(initial_state)

func _switch_state(state: BaseState):
	if current_state != null:
		await current_state.exit()
	current_state = state
	await current_state.enter()

func _physics_process(delta: float) -> void:
	var state = current_state.physics_process(delta)
	if state != null: _switch_state(state)

func _process(delta: float) -> void:
	var state = current_state.process(delta)
	if state != null: _switch_state(state)

func _unhandled_input(event: InputEvent) -> void:
	var state = current_state.unhandled_input(event)
	if state != null: _switch_state(state)

func _input(event: InputEvent) -> void:
	var state = current_state.input(event)
	if state != null: _switch_state(state)
