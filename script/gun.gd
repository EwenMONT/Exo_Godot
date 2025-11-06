extends Node3D

var bullet = load("res://scene/bullet.tscn")
@export var shooting_range = 100
@onready var pos = $RayCast3D


func _physics_process(delta):
	if Input.is_action_just_pressed("fire"):
		shoot()
	pass

func shoot():
	var instance = bullet.instantiate()
	instance.position = pos.global_position
	instance.basis = pos.global_transform.basis
	get_parent().add_child(instance)
	print("squalala")
	print(instance.position)
	pass
