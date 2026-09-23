extends Control

func troca_cena(cena):
	get_tree().change_scene_to_file(cena)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_jogar_pressed() -> void:
	#get_tree().change_scene_to_file("res://cenas/bunker.tscn") # Replace with function body.
	troca_cena("res://cenas/breu.tscn")
func _on_sair_pressed() -> void:
	get_tree().quit() # Replace with function body.


func _on_creditos_pressed() -> void:
	pass # Replace with function body.
