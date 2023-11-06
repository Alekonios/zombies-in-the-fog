extends CanvasLayer

func _input(_event):
	if Input.is_action_just_pressed("esc"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$options2.hide()
		$".".show()
		get_tree().paused = true
		



func _on_button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$".".hide()
	get_tree().paused = false
	


func _on_options_pressed():
	$options2.show()


func _on_quit_main_menu_pressed():
	get_tree().paused = false
	G.DIED = false
	get_tree().change_scene_to_file("res://tscenes/mainmenu.tscn")
