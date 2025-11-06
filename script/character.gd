extends CharacterBody3D

const SENSITIVITY = 0.003
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var vitesse_max: float = 8

@onready var player = $Cupcake_anim3
@onready var animation = $Cupcake_anim3/AnimationPlayer
@onready var pos = $bazooka/RayCast3D

var orientation: float = 0 
var rocket = load("res://scene/sucette_rocket.tscn")

func _ready():
	print("rotation du perso au lancement : ", player.rotation * 180./PI)

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var input_lr = Input.get_axis("player_left", "player_right")
	var input_ud = Input.get_axis("player_down", "player_up")
	var vitesse = Vector3.RIGHT * input_lr + Vector3.FORWARD * input_ud
	
	if vitesse == Vector3(0.0, 0.0, 0.0):
		animation.play("Idle")
	else :
		animation.play("Walking")
	
	position += vitesse_max * vitesse * delta
	if vitesse != Vector3.ZERO:
		orientation = (-Vector3.FORWARD).signed_angle_to(vitesse, Vector3.UP)
	rotation.y = orientation
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	move_and_slide()

func shoot():
	var instance = rocket.instantiate()
	instance.position = pos.global_position
	instance.basis = pos.global_transform.basis
	get_parent().add_child(instance)
	print("squalala")
	print(instance.position)
	pass
