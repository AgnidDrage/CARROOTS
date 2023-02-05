extends Node2D

var landscapePre = preload("res://1.Nodes/1.ParallaxNodes/Landscape.tscn")
var landscape_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnLandscape(Vector2(0, -208))
	spawnLandscape(Vector2(1920, -208))
	

func spawnLandscape(pos):
	landscape_instance = landscapePre.instance()
	var sprite_path = landscape_instance.selectLandscape()
	landscape_instance.get_node("Sprite").texture = load(sprite_path)
	landscape_instance.position = pos
	add_child(landscape_instance)


func _on_DeleteSpriteDetector_body_entered(body):
	if body is Landscape:
		body.queue_free()
		spawnLandscape(Vector2(landscape_instance.position.x + 1920, landscape_instance.position.y))
