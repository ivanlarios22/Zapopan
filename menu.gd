extends Control

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
	# get_tree().change_scene_to_file("res://final.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()
