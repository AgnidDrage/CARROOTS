extends Node2D


export var min_spawn_time:float = 1
export var max_spawn_time:float = 5

var CarrotPre = preload("res://1.Nodes/Carrot.tscn")

var paused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	#pause_mode = self.PAUSE_MODE_PROCESS
	while true:
		var time = rand_range(min_spawn_time, max_spawn_time)
		yield(get_tree().create_timer(time), "timeout")
		carrotSpawn()
		
func _process(delta):
	pass
		
func _input(event):
	if Input.is_action_just_pressed("Pause") and paused == false:
		paused = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("Pause") and paused == true:
		paused = false
		get_tree().paused = false
	elif Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()
	elif Input.is_action_just_pressed("gotomenu"):
		get_tree().change_scene("res://1.Nodes/Menu.tscn")

func carrotSpawn():
	var CarrotInstance = CarrotPre.instance()
	CarrotInstance.position = Vector2(337, 98)
	add_child(CarrotInstance)



func _on_DestroyerDetector_body_entered(body):
	if body is Carrot:
		body.queue_free()
