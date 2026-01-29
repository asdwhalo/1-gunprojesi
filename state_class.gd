extends Node
class_name state
var parent:StateMachine = get_parent()
@export var player:CharacterBody2D
func enter():
	process_mode = ProcessMode.PROCESS_MODE_INHERIT
func exit():
	process_mode = ProcessMode.PROCESS_MODE_DISABLED
