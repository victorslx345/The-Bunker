extends Control
#	CONTROLES DE DEBUG PARA TIRAR NO FINAL:
# mudar os tunros, terminar os ataques, terminar a batle box
@onready var text_cont = $hud/text_container

@export var turnos: int = 1
var guarda_turno
var dialogo_turnos_cont: int = 1
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
	if dialogo_turnos_cont > 2:
		dialogo_turnos_cont = 2
	if turnos > 3:
		turnos = 1
	if vida_inimigo <= 0:
		fim = true
	#if turnos > guarda_turno:
		#guarda_turno = turnos
		#
		#$hud.visible = true
	if dialogo_turnos_cont == 1 and mudar_dialogo == true:
		mudar_dialogo = false
		text_cont.apagar_texto = true
		text_cont.texto = dialogo_turnos['turno1']
		text_cont.can_play = true
	if dialogo_turnos_cont == 2 and mudar_dialogo == true:
		mudar_dialogo = false
		text_cont.apagar_texto = true
		text_cont.texto = dialogo_turnos['turno2']
		text_cont.can_play = true
	bicho.text = str(nome_inimigo,'\n',vida_inimigo,'/',vida_total_inimigo)
	if fim == true and $hud/text_container.texto_terminou == true and Input.is_action_just_pressed("interagir"):
		text_cont.hide()
		$transicao.play("fade_out")
		ScriptsGlobais.derrotou = true
		$sfx/AmalgamMp3160k.stop()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://cenas/TRUE_LAB/corredor_longo.tscn")
func _on_button_pressed() -> void:
	print('a')
