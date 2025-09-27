extends CharacterBody2D

# Atur variabel movement
@export var speed: float = 200.0
@export var jump_force: float = -300.0
@export var gravity: float = 900.0

func _physics_process(delta: float) -> void:
	# Terapin gravitasi
	if not is_on_floor():
		velocity.y += gravity * delta

	# Input kiri/kanan
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
# Flip karakter sesuai arah
	if velocity.x > 0:
		$Sprite2D.scale.x = 1  # normal (menghadap kanan)
	elif velocity.x < 0:
		$Sprite2D.scale.x = -1 # flip (menghadap kiri)
	# Input lompat
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
		
		

	# Gerakin player
	move_and_slide()
