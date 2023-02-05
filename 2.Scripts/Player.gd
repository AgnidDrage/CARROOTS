extends KinematicBody2D


var canHarvest = false
var bodyTemp
var time_alive = 0
var InCooldown = true
var InitialCool = true
var cool_down_time = 1


func _process(delta):
	harvest()

func harvest():
	if InCooldown and InitialCool:
		cooldown()
		InitialCool = false
		return # Break the function
	var levelManager = get_parent().get_node("LevelManager")
	if Input.is_action_just_pressed("Harvest") and InCooldown == false:
		levelManager.stamina -= 15
		if canHarvest: # Modificar para ganar distinto budget segun carrot
			bodyTemp.queue_free()
			levelManager.timeleft += 5
		InCooldown = true
		cooldown()


func _on_CarrotDetector_body_entered(body):
	if body is Carrot:
		canHarvest = true
		bodyTemp = body

func _on_CarrotDetector_body_exited(body):
	if body is Carrot:
		canHarvest = false
		
func cooldown():
	yield(get_tree().create_timer(cool_down_time), "timeout")
	InCooldown = false
