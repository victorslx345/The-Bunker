extends Container
@onready var atacar = $botoes/atacar
@onready var agir = $botoes/agir
@onready var item = $botoes/item
@onready var poupar = $botoes/poupar
@onready var bicho = $"../bicho_info/VBoxContainer/bicho"
@onready var Menu_itens = $"../acoes_hud/item_hud"
@onready var item1 = $"../acoes_hud/item_hud/coluna1/item1"
@onready var item2 = $"../acoes_hud/item_hud/coluna1/item2"
@onready var item3 = $"../acoes_hud/item_hud/coluna1/item3"
@onready var item4 = $"../acoes_hud/item_hud/coluna1/item4"
@onready var item5 = $"../acoes_hud/item_hud/coluna1/item5"
@onready var item6 = $"../acoes_hud/item_hud/coluna1/item6"
@export var modo: String = 'acao'
@export var acao: String
func desativar_botoes(x):
	if x == true:
		atacar.disabled = true
		agir.disabled = true
		item.disabled = true
		poupar.disabled = true
	else:
		atacar.disabled = false
		agir.disabled = false
		item.disabled = false
		poupar.disabled = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if modo == 'escolha' and Input.is_action_just_pressed('voltar'):
		desativar_botoes(false)
		bicho.disabled = true
		modo = 'acao'
		Menu_itens.visible = false
		$"../hud/text_container".visible = true
		$botoes/atacar.grab_focus()
		$"../hud/text_container/texto".visible = true

	if modo == 'agindo' and Input.is_action_just_pressed('voltar'):
		$"../acoes_hud/agir_hud".visible = false
		modo = 'escolha'
		$".".visible = true
		$"../hud/text_container".visible = true
		$"../bicho_info".visible = true
		bicho.disabled = false
		$"../bicho_info/VBoxContainer/bicho".grab_focus()
		$"../hud/text_container/texto".visible = true

	if modo == 'item' and Input.is_action_just_pressed('voltar'):
		modo = 'escolha'
		$"../bicho_info".visible = true
		$botoes/item.grab_focus()
		$"../hud/text_container/texto".visible = true
	
	
	if modo == 'luta':
		$"../battle_box".comecar_batalha = true
func _on_atacar_pressed() -> void:
	desativar_botoes(true)
	bicho.disabled = false
	modo = 'escolha'
	acao = 'atacar'
	$"../sfx/SndSelect".play()
	$"../bicho_info/VBoxContainer/bicho".grab_focus()
	$"../bicho_info".visible = true
	$"../hud/text_container/texto".hide()


func _on_agir_pressed() -> void:
	desativar_botoes(true)
	bicho.disabled = false
	modo = 'escolha'
	acao = 'agir'
	$"../sfx/SndSelect".play()
	$"../bicho_info/VBoxContainer/bicho".grab_focus()
	$"../bicho_info".visible = true
	$"../hud/text_container/texto".hide()

func _on_item_pressed() -> void:
	desativar_botoes(true)
	modo = 'escolha'
	acao = 'item'
	Menu_itens.visible = true
	$"../hud/text_container".visible = false
	$"../sfx/SndSelect".play()
	$"../hud/text_container/texto".hide()
	if item1.focus_mode == Control.FOCUS_NONE:
		item2.grab_focus()
	if item2.focus_mode == Control.FOCUS_NONE:
		item3.grab_focus()
	if item3.focus_mode == Control.FOCUS_NONE:
		item4.grab_focus()
	if item4.focus_mode == Control.FOCUS_NONE:
		item5.grab_focus()
	if item5.focus_mode == Control.FOCUS_NONE:
		item6.grab_focus()
	if item6.focus_mode == Control.FOCUS_NONE:
		item1.grab_focus()
	else:
		item1.grab_focus()
func _on_poupar_pressed() -> void:
	desativar_botoes(true)
	bicho.disabled = false
	modo = 'escolha'
	acao = 'poupar'
	$"../sfx/SndSelect".play()
	$"../bicho_info/VBoxContainer/bicho".grab_focus()
	$"../bicho_info".visible = true
	$"../hud/text_container/texto".hide()
