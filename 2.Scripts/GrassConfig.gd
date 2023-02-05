extends KinematicBody2D

class_name Grass

var spawnPos = Vector2(-480, 270)

func _ready():
	preload("res://3.Assets/1.Art/Pasto Frente.png")
	
func _process(delta):
	self.position.x += -25

func select():
	var imgSprite = "res://3.Assets/1.Art/Pasto Frente.png"
	return imgSprite
	
