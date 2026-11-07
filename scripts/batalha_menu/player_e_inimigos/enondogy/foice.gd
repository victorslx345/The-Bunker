extends Area2D

func dar_dano(valor):
	ScriptsGlobais.kris_status['vida'] -= valor
	SingnalManager.dano.emit()
	return
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite.rotation += 0.1
	$hitboxes.rotation += 0.1
	if position.y >= 160.0:
		$anim.play("explodindo")
		$Sprite.hide()
		await get_tree().create_timer(0.3).timeout
		queue_free()
	else:
		move_local_y(10)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		dar_dano(3)
		print('dano')


func _on_explosao_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		dar_dano(2)
