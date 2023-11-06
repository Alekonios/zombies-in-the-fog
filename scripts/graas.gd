extends Area3D
var grass = null
func _on_body_entered(_body):
	if _body.is_in_group("grass_body"):
		grass = _body
		grass.global_position = $"../grass_node".global_position
