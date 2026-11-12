extends Control
@onready var text_cont = $"../../hud/text_container"
var fechar: bool
@export var turno:float = 1
@export var guarda_turno:float
func add_vida(N:int):
	ScriptsGlobais.kris_status['vida'] += N
	fechar = true
	if ScriptsGlobais.kris_status['vida'] > ScriptsGlobais.kris_status['vida_max']:
		ScriptsGlobais.kris_status['vida'] = ScriptsGlobais.kris_status['vida_max']
	$"../../sfx/SndPower".play()

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../../hud/text_container".texto_terminou == true and fechar == true and Input.is_action_just_pressed("interagir"):
		fechar = false
		$"../../hud/text_container".hide()
		$"../../acts_hud".modo = 'luta'
		$"../../hud/text_container".apagar_texto = true
		$coluna1.visible = true
		hide()
	if turno-guarda_turno == 4:
		turno = -9999
		$"../ataque_hud".dano_boost = 1

func _on_acao_1_pressed() -> void:
	$coluna1.hide()
	$coluna1/acao1.release_focus()
	$"../../acts_hud".modo = 'agiu'
	text_cont.apagar_texto = true
	text_cont.texto = '	*Voce controla a respiração...\n	* Voce recuperou 2 de HP.'
	add_vida(2)
	text_cont.visible = true
	text_cont.can_play = true
	fechar = true
	$"../../hud/text_container/texto".visible = true
	


func _on_acao_2_pressed() -> void:
	guarda_turno = turno
	$coluna1.hide()
	$coluna1/acao2.release_focus()
	$"../../acts_hud".modo = 'agiu'
	text_cont.apagar_texto = true
	text_cont.texto = '	*Você começa a se concentrar...\n	* Ataque aumentado nos proximos 3 turno.'
	$"../ataque_hud".dano_boost = 1.5
	text_cont.visible = true
	text_cont.can_play = true
	fechar = true
	$"../../hud/text_container/texto".visible = true
