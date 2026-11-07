extends Node2D
var projetil = preload("res://cenas/batalha/Inimigos/projetil.tscn")
var atirar: bool
var projetil_saindo = projetil.instantiate()
@export var tempo: int = 10
var comecar:bool
var terminar:bool
var dano = 3

var iframe: bool
var conecta:bool = true
func dar_dano(valor):
	ScriptsGlobais.kris_status['vida'] -= valor
	SingnalManager.dano.emit()
	return
func desligar_ataque():
	terminar = true
	hide()
	$dogy/colisao.monitorable = false
	$dogy/colisao.monitoring = false

func ligar_ataque():
	comecar = true
	visible = true
	$dogy/colisao.monitorable = true
	$dogy/colisao.monitoring = true
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if $"..".turno == 1 and conecta == true:
		conecta = false
		SingnalManager.batalha_comeca.connect(ligar_ataque)
		SingnalManager.batalha_termina.connect(desligar_ataque)
	elif $"..".turno != 1 and conecta == false:
		conecta = true
		SingnalManager.batalha_comeca.disconnect(ligar_ataque)
		SingnalManager.batalha_termina.disconnect(desligar_ataque)
	if $"..".turno == 1:
		if comecar == true:
			comecar = false
			$dogy/sprite.play("abrindo_boca")
			await $dogy/sprite.animation_finished
			$Animation.play("dogy")
			$Timer.start()
		if terminar == true:
			terminar = false
			$Timer.stop()


func _on_timer_timeout() -> void:
	var projetil_saindo = projetil.instantiate()
	projetil_saindo.position.x = $dogy.position.x - 7
	projetil_saindo.position.y = $dogy.position.y - 2
	add_child(projetil_saindo)


func _on_colisao_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'alma':
		dar_dano(3)
