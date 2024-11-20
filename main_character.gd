extends CharacterBody3D

var curHp = 10
var maxHp = 10
var damage = 1

var gold = 0

var attackrate = 3
var lasAttackTime = 0

var moveSpeed = 5.0
var jumpForce = 10.0
var gravity = 15.0

@onready var camera = $Pivote
@onready var attackCast = $AttackRayCast

func _ready():
	pass

func _physics_process(delta: float) -> void:
	# Crear un vector de entrada
	var input = Vector3()

	# Movimiento basado en entrada
	if Input.is_action_pressed("ui_up"):
		input.z += 1  # En Godot 4, Z positivo apunta hacia adelante, así que usamos negativo

	if Input.is_action_pressed("ui_down"):
		input.z -= 1

	if Input.is_action_pressed("ui_left"):
		input.x += 1

	if Input.is_action_pressed("ui_right"):
		input.x -= 1

	# Normalizar el vector de entrada para evitar velocidad extra en movimiento diagonal
	input = input.normalized()

	# Convertir el input local a coordenadas globales
	var direction = (transform.basis.z * input.z + transform.basis.x * input.x).normalized()

	# Configurar el movimiento horizontal
	velocity.x = direction.x * moveSpeed
	velocity.z = direction.z * moveSpeed

	# Aplicar la gravedad
	if not is_on_floor():  # Solo aplica gravedad si no estás en el suelo
		velocity.y -= gravity * delta
	else:
		# Salto si estás en el suelo y presionas "ui_accept" (normalmente la tecla Enter o Espacio)
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jumpForce

	# Usar move_and_slide para mover el personaje
	move_and_slide()
