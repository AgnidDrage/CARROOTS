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
	self.position.x += -5

func selectLandscape():
	random.randomize()
	var prob = random.randf_range(0, 1)
	var imgSprite
	if prob < 0.19:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Arbol.png"
	elif prob >= 0.19 and prob < 0.19*2:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Cultivo.png"
	elif prob >= 0.19*2 and prob < 0.19*3:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Granja.png"
	elif prob >= 0.19*3 and prob < 0.19*4:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Vacas.png"
	elif prob >= 0.19*4 and prob < 0.19*5:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio.png"
	elif prob >= 0.19*5:
		imgSprite = "res://3.Assets/1.Art/Fondo Medio/Fondo Medio Random.png"
	return imgSprite

	
	
	
