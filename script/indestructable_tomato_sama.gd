extends Node3D

var pv = 10

func _on_area_3d_area_entered(area: Area3D) -> void:
	pv -= 1
	if pv == 0:
		self.queue_free()
