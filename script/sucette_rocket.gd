extends Area3D

var speed = 50

func _process(delta):
	position += transform.basis * Vector3(0, 0, speed) * delta

func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	self.queue_free()
