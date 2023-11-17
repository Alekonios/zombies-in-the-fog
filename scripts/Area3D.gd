extends Area3D
var green = null


func _on_body_entered(_body):
	if _body.is_in_group("green_zombie") or _body.is_in_group("red_zombie") or _body.is_in_group("grass_body_stat") or _body.is_in_group("zabor") or _body.is_in_group("airplane") or _body.is_in_group("box"):
		green = _body
		green.queue_free()

