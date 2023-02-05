extends Node2D

var landscapePre = preload("res://1.Nodes/1.ParallaxNodes/Landscape.tscn")
var roadPre = preload("res://1.Nodes/1.ParallaxNodes/Road.tscn")
var grassPre = preload("res://1.Nodes/1.ParallaxNodes/Grass.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn(landscapePre, Vector2(0, -50))
	spawn(landscapePre, Vector2(1920, -50))
	spawn(roadPre, Vector2(-480*2, 120))
	spawn(roadPre, Vector2(0, 120))
	spawn(roadPre, Vector2(480*2, 120))
	spawn(roadPre, Vector2(480*4, 120))
	spawn(grassPre, Vector2(-480*2, 0))
	spawn(grassPre, Vector2(0, 0))
	spawn(grassPre, Vector2(480*2, 0))
	spawn(grassPre, Vector2(480*4, 0))
	
func spawn(preloadObj, pos):
	var obj_instance = preloadObj.instance()
	var sprite_path = obj_instance.select()
	obj_instance.get_node("Sprite").texture = load(sprite_path)
	obj_instance.position = pos
	add_child(obj_instance)

func _on_LandscapeDetect_body_entered(body):
	if body is Landscape:
		spawn(landscapePre, Vector2(body.position.x + 1920*2, body.position.y))
		body.queue_free()

func _on_RoadDetect_body_entered(body):
	if body is Road:
		spawn(roadPre, Vector2(body.position.x + 1920*2, body.position.y))
		body.queue_free()
	if body is Grass:
		spawn(grassPre, Vector2(body.position.x + 1920*2, body.position.y))
		body.queue_free()
	
