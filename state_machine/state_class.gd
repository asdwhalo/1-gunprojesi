extends Node
class_name state
@export var parent:StateMachine = get_parent()
@export var player:CharacterBody2D
func enter():
	set_process(true)
	#process_mode = ProcessMode.PROCESS_MODE_INHERIT
func exit():
	set_process(false)
	#process_mode = ProcessMode.PROCESS_MODE_DISABLED
