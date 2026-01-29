extends CharacterBody2D
class_name Entity
var hp:float = 10

func take_damage(amount):
	hp -= amount
