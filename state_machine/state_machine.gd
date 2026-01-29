extends Node 
class_name StateMachine

var current_state : state = null
var player:CharacterBody2D = get_parent()
@export var ground_state :state



func change_state(new_state:state)->void:
	var old_state = current_state
	current_state = new_state
	print(str(current_state.name))
	old_state.exit()
	current_state.enter()
	
