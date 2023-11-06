extends Node3D
var perekluch = false


func _ready():
	await get_tree().create_timer(2, false).timeout
func _on_play_pressed():
	$ColorRect.show()
	$AnimationPlayer.play("blackest")
	await get_tree().create_timer(0.5, false).timeout
	get_tree().change_scene_to_file("res://tscenes/1_level.tscn")


func _on_options_pressed():
	$Node2D/Label/play.hide()
	$Node2D/Label/options.hide()
	$"Node2D/Label/quit game".hide()
	$options.show()
	$Button.show()

func _on_button_pressed():
	$options.hide()
	$Button.hide()
	$Node2D/Label/play.show()
	$Node2D/Label/options.show()
	$"Node2D/Label/quit game".show()


func _on_quit_game_pressed():
	get_tree().quit()



func _on_play_mouse_entered():
		$AudioStreamPlayer.play()

func _on_options_mouse_entered():
	$AudioStreamPlayer.play()

func _on_quit_game_mouse_entered():
	$AudioStreamPlayer.play()

#magnitola
func _on_right_pressed():
	perekluch = true
	$Magnitola/AudioStreamPlayer3D.stop()
	$Magnitola/AnimationPlayer.stop()
	$Magnitola/perekluch.play()
	$Magnitola/solnce.play()
	await get_tree().create_timer(0.5, false).timeout
	perekluch = false


func _on_timer_timeout():
	if perekluch == false:
		await get_tree().create_timer(1, false).timeout
		$Magnitola/AnimationPlayer.play("bus")


func _on_left_pressed():
	perekluch = true
	$Magnitola/solnce.stop()
	$Magnitola/AnimationPlayer.stop()
	$Magnitola/perekluch.play()
	$Magnitola/AudioStreamPlayer3D.play()
	await get_tree().create_timer(3, false).timeout
	perekluch = false
