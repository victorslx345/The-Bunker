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
	ScriptsGlobais.inventario['slot1'] = ScriptsGlobais.inventario_save['slot1']
	ScriptsGlobais.inventario['slot2'] = ScriptsGlobais.inventario_save['slot2']
	ScriptsGlobais.inventario['slot3'] = ScriptsGlobais.inventario_save['slot3']
	ScriptsGlobais.inventario['slot4'] = ScriptsGlobais.inventario_save['slot4']
	ScriptsGlobais.inventario['slot5'] = ScriptsGlobais.inventario_save['slot5']
	ScriptsGlobais.inventario['slot6'] = ScriptsGlobais.inventario_save['slot6']
	ScriptsGlobais.kris_status['vida'] = ScriptsGlobais.kris_status['vida_max']
	get_tree().change_scene_to_file("res://cenas/TRUE_LAB/corredor_longo.tscn")
	

func _on_sair_pressed() -> void:
	queue_free()
