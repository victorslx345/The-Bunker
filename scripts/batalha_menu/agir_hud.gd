extends Control
@onready var text_cont = $"../../hud/text_container"
var fechar: bool
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


func _on_acao_1_pressed() -> void:
	$coluna1.hide()
	$coluna1/acao1.release_focus()
	text_cont.apagar_texto = true
	text_cont.texto = '	*Voce controla a respiração...\n	* Voce recuperou 4 de HP.'
	add_vida(4)
	text_cont.visible = true
	text_cont.can_play = true
	fechar = true
	$"../../hud/text_container/texto".visible = true
