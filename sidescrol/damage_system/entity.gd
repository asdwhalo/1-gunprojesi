extends CharacterBody2D
class_name Entity
@export var hp:float = 10

signal health_is_zero
signal damaged

func take_damage(amount):
	hp -= amount
	damaged.emit()
	print(str(self.name) +" taked " +str(amount) +" damage")
	if hp <= 0:
		health_is_zero.emit()
