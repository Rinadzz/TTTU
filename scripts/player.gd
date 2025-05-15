extends CharacterBody2D

@export var speed = 350
@export var jump_hight = -550
@export var gravity_force = 1250

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
	var direction = Input.get_axis("left","right")
	
	if !is_on_floor() :
		velocity.y += gravity_force * delta
	
	if direction :
		if is_on_floor():
			$texture.play("walk")
		velocity.x = direction * speed
	else :
		if is_on_floor():
			$texture.play("idle")
		velocity.x = 0
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		$texture.play("jump")
		velocity.y = jump_hight
	
	if direction > 0:
		$texture.flip_h = false
	elif direction < 0 :
		$texture.flip_h = true
	
	move_and_slide()
