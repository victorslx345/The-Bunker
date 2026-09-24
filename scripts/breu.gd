extends Node2D
var flag = false
var anim = true
func _ready() -> void:
	pass



func _process(delta: float) -> void:
	if anim == true:
		$kris.mover = false
		$kris.move_local_x(1)
		$kris/kris_sprites.play("andando_lado")
		$kris/idle.visible = false
		$kris/kris_sprites.visible = true

	if flag == true and Input.is_action_pressed("interagir"):
		$cenario/Porta.visible = false
		$cenario/porta.playing = true
		$kris/idle.animation = 'esquerda'
		$kris/idle.frame = 0
		$brilho/brilho_sprite.visible = false
		$brilho/CollisionShape2D.disabled = true
		flag = false
		
		



func _on_brilho_body_entered(body: Node2D) -> void:
	flag = true # Replace with function body.


func _on_timer_timeout() -> void:
	anim = false
	$kris/idle.visible = true
	$kris/kris_sprites.visible = false
	$kris.mover = true
	$kris/idle.play("direita")


func _on_cair_timeout() -> void:
	pass
