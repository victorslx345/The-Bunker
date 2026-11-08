extends Node2D

@onready var bicho = $"../../kris/bicho"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ScriptsGlobais.derrotou == true:
		$aparecer.monitorable = false
		$aparecer.monitoring = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_aparecer_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		SingnalManager.mover.emit()
		ScriptsGlobais.inventario_save['slot1'] = ScriptsGlobais.inventario['slot1']
		ScriptsGlobais.inventario_save['slot2'] = ScriptsGlobais.inventario['slot2']
		ScriptsGlobais.inventario_save['slot4'] = ScriptsGlobais.inventario['slot4']
		ScriptsGlobais.inventario_save['slot5'] = ScriptsGlobais.inventario['slot5']
		ScriptsGlobais.inventario_save['slot6'] = ScriptsGlobais.inventario['slot6']
		$"../../kris/darkworld_idle".visible = true
		$"../../kris/darkworld".hide()
		bicho.visible = true
		$"../../sfx/SndB".play()
		await get_tree().create_timer(1).timeout
		bicho.play("inicio")
		await bicho.animation_finished
		await get_tree().create_timer(0.7).timeout
		$"../../sfx/MusSfxGenerate".play()
		bicho.play("transformacao")
		await bicho.animation_finished
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("batalha")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://cenas/batalha/Inimigos/batalha_menu_enondogy.tscn")
