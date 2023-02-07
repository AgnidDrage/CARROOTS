extends Node2D


export var min_spawn_time:float = 1
export var max_spawn_time:float = 5

var CarrotPre = preload("res://1.Nodes/Carrot.tscn")
var Carrot01 = preload("res://1.Nodes/2.CarrotsNodes/Carrot01.tscn")
var Carrot02 = preload("res://1.Nodes/2.CarrotsNodes/Carrot02.tscn")
var Carrot03 = preload("res://1.Nodes/2.CarrotsNodes/Carrot03.tscn")

var paused = false
var random = RandomNumberGenerator.new()

var isHarvested = false
var carrotType
var carrotPosition


# Called when the node enters the scene tree for the first time.
func _ready():
	#pause_mode = self.PAUSE_MODE_PROCESS
#	preload("res://3.Assets/1.Art/Carrots/SoilA - 01.png")
#	preload("res://3.Assets/1.Art/Carrots/SoilB - 01.png")
#	preload("res://3.Assets/1.Art/Carrots/SoilC - 01.png")
	while true:
		var time = rand_range(min_spawn_time, max_spawn_time)
		yield(get_tree().create_timer(time), "timeout")
		carrotSpawn()
		

		
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
	var carrotPre = selectCarrot()
	var carrot_instance = carrotPre.instance()
	carrot_instance.position = Vector2(1090, 310)
	add_child(carrot_instance)

func selectCarrot():
	random.randomize()
	var prob = random.randf_range(0, 1)
	var imgSprite
	if prob < 0.5:
		 return Carrot01
	elif prob >= 0.5 and prob <0.85:
		return Carrot03
	elif prob >= 0.85 and prob < 1:
		return Carrot02

func _on_DestroyerDetector_body_entered(body):
	if body is Carrot:
		body.queue_free()
		
