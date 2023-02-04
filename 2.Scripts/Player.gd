extends KinematicBody2D


var canHarvest = false
var bodyTemp


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	harvest()

func harvest():
	if canHarvest:
		if Input.is_action_just_pressed("Harvest"):
			bodyTemp.queue_free()

func _on_CarrotDetector_body_entered(body):
	if body is Carrot:
		canHarvest = true
		bodyTemp = body


func _on_CarrotDetector_body_exited(body):
	if body is Carrot:
		canHarvest = false
