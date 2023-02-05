extends KinematicBody2D

class_name Carrot01

export var staminaConsumption = -15

export var moneyAdquired = 3

var isHarvested = false

func _ready():
	$KineticAnimation.hide()
	preload("res://3.Assets/1.Art/Carrots/SoilA - 01.png")
	preload("res://3.Assets/1.Art/Carrots/SpriteSheet - CarrotA_Harvested.png")


func _process(delta):
	position.x += -17
	changeSprite()

func changeSprite():
	if isHarvested:
		get_node("Sprite").texture = load("res://3.Assets/1.Art/Carrots/SoilA - 01.png")
		runAnimation()

func runAnimation():
	$KineticAnimation.show()
	#$KineticAnimation.position.x = position.x
	$KineticAnimation.position.y = position.y - 500
	$KineticAnimation/AnimationPlayer.play("Harvested01")

	$KineticAnimation/Sprite.position.y = position.y - 300
	
	
	
