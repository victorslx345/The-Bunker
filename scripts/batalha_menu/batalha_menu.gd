extends Control
#	CONTROLES DE DEBUG PARA TIRAR NO FINAL:
# mudar os tunros, terminar os ataques, terminar a batle box
@onready var text_cont = $hud/text_container

@export var turnos: int = 1
var guarda_turno

@export var dialogo_turnos = {
	'turno1' : str('	* '),
	'turno2' : str('	* ')
}
@onready var bicho = $bicho_info/VBoxContainer/bicho
@export var vida_inimigo:int 
@export var vida_total_inimigo:int = vida_inimigo
@export var nome_inimigo: String
@export var fim: bool = false
#var inimigo_hp:int
#var Status_inimigo = {
	#'vida' : '',
	#'vida_max' : '',
	#'nome' : '',
#}
var mudar_dialogo: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$sfx/AmalgamMp3160k.play()
	$acts_hud/botoes/atacar.grab_focus()
	guarda_turno = turnos
	mudar_dialogo = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if turnos > guarda_turno:
		guarda_turno = turnos
		$acts_hud.desativar_botoes(false)
		$hud.visible = true
	if turnos == 1 and mudar_dialogo == true:
		mudar_dialogo = false
		text_cont.apagar_texto = true
		text_cont.texto = dialogo_turnos['turno1']
		text_cont.can_play = true
	if turnos == 2 and mudar_dialogo == true:
		mudar_dialogo = false
		text_cont.apagar_texto = true
		text_cont.texto = dialogo_turnos['turno2']
		text_cont.can_play = true
	bicho.text = str(nome_inimigo,'\n',vida_inimigo,'/',vida_total_inimigo)
	if fim == true and $hud/text_container.texto_terminou == true and Input.is_action_just_pressed("interagir"):
		pass
func _on_button_pressed() -> void:
	print('a')
