extends Node2D
var projetil = preload("res://cenas/batalha/Inimigos/projetil.tscn")
var atirar: bool
var projetil_saindo = projetil.instantiate()
@export var tempo: int = 10
@onready var rodar:bool = $"../..".liga_padrao1
@onready var parar:bool =  $"../..".desliga_padrao1
var dano = 3
var liga: bool = true
var desliga = true

func dar_dano(valor):
	ScriptsGlobais.kris_status['vida'] -= valor
	SingnalManager.dano.emit()
	return
func desligar_ataque(x:bool):
	if x == true:
		x = false
		hide()
		$dogy/colisao.monitorable = false
		$dogy/colisao.monitoring = false
		$Timer.stop()
func ligar_ataque(x:bool):
	if x == true:
		x = false
		visible = true
		$dogy/colisao.monitorable = true
		$dogy/colisao.monitoring = true
		rodar = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rodar = $"../..".liga_padrao1
	parar = $"../..".desliga_padrao1
	if desliga == true and parar == true:
		desliga = false
		desligar_ataque(true)
		await get_tree().create_timer(2).timeout
		desliga = true
	if rodar == true and liga == true:
		ligar_ataque(true)
		liga = false
		rodar = false
		$dogy/sprite.play("abrindo_boca")
		await $dogy/sprite.animation_finished
		$Animation.play("dogy")
		$Timer.start()
		await get_tree().create_timer(tempo+1).timeout
		liga = true



func _on_timer_timeout() -> void:
	var projetil_saindo = projetil.instantiate()
	projetil_saindo.position.x = $dogy.position.x - 7
	projetil_saindo.position.y = $dogy.position.y - 2
	add_child(projetil_saindo)


func _on_colisao_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'alma':
		dar_dano(3)
