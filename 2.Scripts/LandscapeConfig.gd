extends KinematicBody2D

class_name Landscape

var spawnPos = Vector2(1920, -208)
var random = RandomNumberGenerator.new()

func _ready():
	preload("res://3.Assets/1.Art/Fondo Medio/Fondo Medio Arbol.png")
	preload("res://3.Assets/1.Art/Fondo Medio/Fondo Medio Cultivo.png")
	preload("res://3.Assets/1.Art/Fondo Medio/Fondo Medio Granja.png")
	preload("res://3.Assets/1.Art/Fondo Medio/Fondo Medio Random.png")
	preload("res://3.Assets/1.Art/Fondo Medio/Fondo Medio Vacas.png")
	preload("res://3.Assets/1.Art/Fondo Medio/Fondo Medio.png")

func _process(delta):
	self.position.x += -2

func select():
	random.randomize()
	var prob = random.randf_range(0, 1)
	var imgSprite
	if prob < 0.19:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Arbol.png"
	elif prob >= 0.19 and prob < 0.38:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Cultivo.png"
	elif prob >= 0.38 and prob < 0.57:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Granja.png"
	elif prob >= 0.57 and prob < 0.76:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Vacas.png"
	elif prob >= 0.76 and prob < 0.95:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio.png"
	elif prob >= 0.95 and prob < 1:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Random.png"
	return imgSprite

	
	
	
