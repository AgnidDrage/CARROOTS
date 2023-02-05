extends Node


var score = 0
var stamina = 100
var timeleft = 50

var barraStamina

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	barraStamina = get_tree().get_nodes_in_group("StaminaBar")[0]
	while true:
		yield(get_tree().create_timer(1), "timeout")
		score +=1
		timeleft -= 1
		if stamina < 100:
			stamina += 5
	

func _process(delta):
	get_parent().get_node("UserInterface/CanvasLayer/RichTextLabel").text = "Time without starving: " + str(score)+"\nBudget: " + str(timeleft)# + "\nStamina: " + str(stamina)
	update_StaminaBar()
	gameover()

func update_StaminaBar():
	barraStamina.value = stamina

func gameover():
	if stamina <= 0 or timeleft <= 0:
		get_tree().change_scene("res://1.Nodes/GameOver.tscn")


