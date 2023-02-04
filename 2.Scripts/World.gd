extends Node2D


export var min_spawn_time:float = 1
export var max_spawn_time:float = 5

var CarrotPre = preload("res://1.Nodes/Carrot.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	while true:
		var time = rand_range(min_spawn_time, max_spawn_time)
		yield(get_tree().create_timer(time), "timeout")
		carrotSpawn()

func carrotSpawn():
	var CarrotInstance = CarrotPre.instance()
	CarrotInstance.position = Vector2(337, 75)
	self.add_child(CarrotInstance)


func _on_DestroyerDetector_body_entered(body):
	if body is Carrot:
		body.queue_free()
