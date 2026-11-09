extends Node2D

var comecar:bool
var terminar:bool
var conecta:bool
var timer = 0.5
var alma_x = ScriptsGlobais.kris_status['alma_pos_x']
var alma_y = ScriptsGlobais.kris_status['alma_pos_y']


func dar_dano(valor):
	ScriptsGlobais.kris_status['vida'] -= valor
	SingnalManager.dano.emit()
	return

func comecar_batalha():
	comecar = true
	visible = true
	$dogy.global_position = Vector2(0,-4)
	return

func terminar_batalha():
	terminar = true
	hide()
	return
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".turno == 4 and conecta == true:
		conecta = false
		SingnalManager.batalha_comeca.connect(comecar_batalha)
		SingnalManager.batalha_termina.connect(terminar_batalha)
	if $"..".turno != 4:
		conecta = true
	if $"..".turno == 4:
		if comecar == true:
			comecar = false
			await get_tree().create_timer(timer).timeout
			$dogy/sprite.play("default")
			$Timer.start()
			await $dogy/sprite.animation_finished
			$dogy/sprite.play("foguete")
		if terminar == true:
			terminar = false
			$Timer.stop()


func _on_colisao_dogy_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		print('dano')
		dar_dano(3)
