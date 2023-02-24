extends Control

onready var audioStream = $Start/AudioStreamPlayer

func _ready():
	#get_node("VideoPlayer").play()
	preload("res://1.Nodes/MainGame.tscn")

func _on_Start_button_down():
	get_tree().change_scene("res://1.Nodes/MainGame.tscn")



func _on_Quit_button_down():
	get_tree().quit()


func play_and_wait_for_sound(audio_stream_player):
	audio_stream_player.play()
	while audio_stream_player.playing:
		yield()


func _on_Start_pressed():
	audioStream.play()
	while audioStream.is_playing():
		yield()
