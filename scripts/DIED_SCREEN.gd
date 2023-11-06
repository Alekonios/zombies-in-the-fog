extends Node2D
var fuck = false
func _process(delta):
	$Label2.text = "SCORE:" + str(G.P_SCORE)
	$Label3.text = "max score:" + str(G.N_SCORE)
	if G.DIED == true:
		$".".show()
		await get_tree().create_timer(2, false).timeout
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if fuck == false:
			_anim()
func _anim():
	$AnimationPlayer.play("died")
	fuck = true



func _on_button_pressed():
	G.DIED = false
	get_tree().change_scene_to_file("res://tscenes/1_level.tscn")
	$".".hide()
