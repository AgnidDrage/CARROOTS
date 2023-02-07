extends KinematicBody2D


var canHarvest = false
var bodyTemp
var carrotType
var time_alive = 0
var InCooldown = true
var InitialCool = true
var cool_down_time = 1
var harvest_anim = false

const staminaData = {
	0: -15,
	1: -60,
	2: -30,
	3: -15
}

const moneyEarned = {
	0: 3,
	1: 10,
	2: 7
}

func _ready():
	$AnimationPlayer.play("Run")
	carrotType = 3

func _physics_process(delta):
	harvest()

func harvest():
		if InCooldown and InitialCool:
			cooldown()
			InitialCool = false
			return # Break the function
		var levelManager = get_parent().get_node("LevelManager")
		if Input.is_action_just_pressed("Harvest") and InCooldown == false:
			$AnimationPlayer.play("Harvest")
			levelManager.stamina += staminaData[carrotType]
			if canHarvest:
				if carrotType == null:
					return
				levelManager.timeleft += moneyEarned[carrotType]
				bodyTemp.isHarvested = true
			InCooldown = true
			cooldown()
		$AnimationPlayer.queue("Run")


func _on_CarrotDetector_body_entered(body):
	if body is Carrot01:
		canHarvest = true
		bodyTemp = body
		carrotType = 0
	elif body is Carrot02:
		canHarvest = true
		bodyTemp = body
		carrotType = 1
	elif body is Carrot03:
		canHarvest = true
		bodyTemp = body
		carrotType = 2

func _on_CarrotDetector_body_exited(body):
	if body is Carrot01:
		canHarvest = false
		carrotType = 3
	elif body is Carrot02:
		canHarvest = false
		carrotType = 3
	elif body is Carrot03:
		canHarvest = false
		carrotType = 3

func cooldown():
	yield(get_tree().create_timer(cool_down_time), "timeout")
	InCooldown = false
