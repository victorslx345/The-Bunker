extends Node2D

var comecar:bool
var terminar:bool
var conecta:bool
var timer = 0.5



func dar_dano(valor):
	ScriptsGlobais.kris_status['vida'] -= valor
	SingnalManager.dano.emit()
	return

func comecar_batalha():
	comecar = true
	visible = true
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
			$Timer.start()
			SingnalManager.lazer.emit()
		if terminar == true:
			terminar = false
			$Timer.stop()





func _on_lazer_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		dar_dano(3)
		print('blaster1')


func _on_lazer_2_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		dar_dano(3)
		print('blaster2')
