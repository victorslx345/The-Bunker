extends Area2D

func dar_dano(valor):
	ScriptsGlobais.kris_status['vida'] -= valor
	SingnalManager.dano.emit()
	return

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await get_tree().create_timer(0.2).timeout
	$sprite.play("default")
	if $sprite.frame >= 3 and $sprite.frame <= 14:
		$hitbox.disabled = false
		monitorable = true
		monitoring = true
	else:
		$hitbox.disabled = true
		monitorable = false
		monitoring = false
	await $sprite.animation_finished
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		dar_dano(2)
		print('explosao')
