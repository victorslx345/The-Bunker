extends Control

func troca_cena(cena):
	get_tree().change_scene_to_file(cena)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bunker_pressed() -> void:
	troca_cena("res://cenas/bunker.tscn")


func _on_breu_pressed() -> void:
	troca_cena("res://cenas/breu.tscn")


func _on_lab_inicial_pressed() -> void:
	troca_cena("res://cenas/TRUE_LAB/lab_incial.tscn")


func _on_text_box_pressed() -> void:
	troca_cena("res://cenas/text_box.tscn")


func _on_lab_area_1_pressed() -> void:
	troca_cena("res://cenas/TRUE_LAB/lab_area_1.tscn")
