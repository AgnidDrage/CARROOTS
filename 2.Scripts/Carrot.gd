extends KinematicBody2D

class_name Carrot

var movement = Vector2(-20,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position.x += -2

