extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$anim.play("game_over")
	await get_tree().create_timer(0.8).timeout
	$HBoxContainer/continuar.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_continuar_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/batalha/Inimigos/batalha_menu_enondogy.tscn")
	
	


func _on_sair_pressed() -> void:
	queue_free()
