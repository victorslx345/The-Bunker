extends Control
@onready var text_cont = $"../../hud/text_container"
var fechar: bool
# Called when the node enters the scene tree for the first time.
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
	text_cont.texto = '	*Voce controla a respiração...\n	* Defesa aumentada em 2 durante esse turno.'
	text_cont.visible = true
	text_cont.can_play = true
	fechar = true
	$"../../hud/text_container/texto".visible = true
