extends Control

func troca_cena(cena):
	get_tree().change_scene_to_file(cena)
func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_jogar_pressed() -> void:
	#get_tree().change_scene_to_file("res://cenas/breu.tscn") 
	troca_cena("res://cenas/bunker.tscn")
func _on_sair_pressed() -> void:
	get_tree().quit() 


func _on_creditos_pressed() -> void:
	pass 



func _on_debug_pressed() -> void:
	troca_cena("res://cenas/debug.tscn")
	
