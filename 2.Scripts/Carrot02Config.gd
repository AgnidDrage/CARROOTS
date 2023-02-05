extends KinematicBody2D

class_name Carrot02

export var staminaConsumption = -30

export var moneyAdquired = 7

var isHarvested = false

func _ready():
	$KineticAnimation.hide()
	preload("res://3.Assets/1.Art/Carrots/SoilB - 01.png")

func _process(delta):
	position.x += -17
	changeSprite()

func changeSprite():
	if isHarvested:
		get_node("Sprite").texture = load("res://3.Assets/1.Art/Carrots/SoilB - 01.png")
		runAnimation()

func runAnimation():
	$KineticAnimation.show()
	#$KineticAnimation.position.x = position.x
	$KineticAnimation.position.y = position.y - 500
	$KineticAnimation/AnimationPlayer.play("Harvested02")

	$KineticAnimation/Sprite.position.y = position.y - 300
	
