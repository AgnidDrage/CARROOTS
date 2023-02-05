extends KinematicBody2D

class_name Carrot02

export var staminaConsumption = -30

export var moneyAdquired = 7

var isHarvested = false

func _ready():
	preload("res://3.Assets/1.Art/Carrots/SoilB - 01.png")

func _process(delta):
	position.x += -17
	changeSprite()

func changeSprite():
	if isHarvested:
		get_node("Sprite").texture = load("res://3.Assets/1.Art/Carrots/SoilB - 01.png")
