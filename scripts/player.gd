extends CharacterBody2D

@export var speed = 350
@export var jump_hight = -550
@export var gravity_force = 1250

var jumps_count = 0
var max_jumps = 2

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
	if jumps_count < 2 :
		if Input.is_action_just_pressed("jump"):
			jumps_count += 1
			$texture.play("jump")
			velocity.y = jump_hight
	
	if is_on_floor() and jumps_count != 0:
		jumps_count = 0
	else :
		if jumps_count ==0 :
			jumps_count +=1
	
	if direction > 0:
		$texture.flip_h = false
	elif direction < 0 :
		$texture.flip_h = true
	
	move_and_slide()
