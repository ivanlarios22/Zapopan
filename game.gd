extends Control

var score = 0
@onready var scoreLabel = $Score

# Contador de frames
var frame_count = 0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Incrementar el contador de frames
	frame_count += 1
	
	# Actualizar el puntaje cada 50 frames
	if frame_count >= 40:
		frame_count = 0  # Reiniciar el contador
		score += 1
		scoreLabel.text = "Puntaje: %d" % score
		
		# Verificar si el puntaje alcanza 30
		if score > 10:
			change_to_final_scene()

# Cambiar a la escena de finalización
func change_to_final_scene() -> void:
	get_tree().change_scene_to_file("res://final.tscn")
