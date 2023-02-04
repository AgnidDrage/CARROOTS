extends Control


func _on_Button_button_down():
	get_tree().change_scene("res://1.Nodes/MainGame.tscn")

func _on_Start_button_down():
	get_tree().change_scene("res://1.Nodes/MainGame.tscn")


func _on_Quit_button_down():
	get_tree().quit()
