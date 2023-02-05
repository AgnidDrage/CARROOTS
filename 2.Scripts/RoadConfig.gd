extends KinematicBody2D

class_name Road

var spawnPos = Vector2(1920, -250)
var random = RandomNumberGenerator.new()

func _ready():
	preload("res://3.Assets/1.Art/Piso/Piso 1 Charco.png")
	preload("res://3.Assets/1.Art/Piso/Piso 1.png")
	preload("res://3.Assets/1.Art/Piso/Piso 2 Piedras.png")
	preload("res://3.Assets/1.Art/Piso/Piso 2.png")

func _process(delta):
	self.position.x += -20
	
func select():
	random.randomize()
	var prob = random.randf_range(0, 1)
	print(prob)
	var imgSprite
	if prob < 0.35:
		imgSprite = "res://3.Assets/1.Art/Piso/Piso 1.png"
	elif prob >= 0.35 and prob < 0.70:
		imgSprite = "res://3.Assets/1.Art/Piso/Piso 2.png"
	elif prob >= 0.70 and prob < 0.85:
		imgSprite = "res://3.Assets/1.Art/Piso/Piso 2 Piedras.png"
	elif prob >= 0.85 and prob < 1:
		imgSprite = "res://3.Assets/1.Art/Piso/Piso 1 Charco.png"
		
	return imgSprite
	
