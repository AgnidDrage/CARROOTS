extends Node


var score = 0
var stamina = 15
var timeleft = 50

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_parent().get_node("UserInterface/GameOverPanel").hide()
	while true:
		yield(get_tree().create_timer(1), "timeout")
		score +=1
		timeleft -= 1
		if stamina < 100:
			stamina += 5


func _process(delta):
	get_parent().get_node("UserInterface/CanvasLayer/RichTextLabel").text = "Time without starving: " + str(score)+"\nBudget: " + str(timeleft) + "\nStamina: " + str(stamina)
	gameover()

func gameover():
	if stamina <= 0 or timeleft <= 0:
		get_tree().change_scene("res://1.Nodes/GameOver.tscn")


