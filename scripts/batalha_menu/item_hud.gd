extends Control
@export var inv = ScriptsGlobais.inventario
@onready var item1 = $coluna1/item1
@onready var item2 = $coluna1/item2
@onready var item3 = $coluna1/item3
@onready var item4 = $coluna1/item4
@onready var item5 = $coluna1/item5
@onready var item6 = $coluna1/item6
@onready var terto_terminou = $"../../hud/text_container".texto_terminou

var fechar:bool
var Inv = ScriptsGlobais.inventario
@export var textos = {
	'ovo' = '	* Voce usou o ovo e recuperou 6 HP'
}

func add_vida(N:int):
	$"../../hud/status_hud/vida".vida += N
	fechar = true
	if $"../../hud/status_hud/vida".vida > $"../../hud/status_hud/vida".vida_max:
		$"../../hud/status_hud/vida".vida = $"../../hud/status_hud/vida".vida_max
	$"../../sfx/SndPower".play()

func ativar_texto(item,texto,mais_texto:bool):
	item.text = ''
	item.disabled = true
	$".".visible = false
	$"../../hud/text_container".visible = true
	$"../../hud/text_container".apagar_texto = true
	$"../../hud/text_container/texto".visible = true
	$"../../hud/text_container".texto = texto
	$"../../hud/text_container".can_play = true
	$"../../hud/text_container".mais_texto = mais_texto
func item(item,slots: Button):
	for slot in ScriptsGlobais.inventario.keys():
		if ScriptsGlobais.inventario[slot] != '' and ScriptsGlobais.inventario[slot] != 'retirado':
			slots.text += ScriptsGlobais.inventario[slot]
			slots.disabled = false
			ScriptsGlobais.inventario[slot] = 'retirado'
			return
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item(inv,$coluna1/item1)
	item(inv,$coluna1/item2)
	item(inv,$coluna1/item3)
	item(inv,$coluna1/item4)
	item(inv,$coluna1/item5)
	item(inv,$coluna1/item6)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../../hud/text_container".texto_terminou == true and fechar == true and Input.is_action_just_pressed("interagir"):
		fechar = false
		$"../../hud/text_container".apagar_texto = true
		$"../../hud/text_container".hide()
		$"../../acts_hud".modo = 'luta'

func _on_item_1_pressed() -> void:
	$coluna1/item1.focus_mode = Control.FOCUS_NONE
	if item1.text == 'ovo':
		#ScriptsGlobais.inventario_save['slot1'] = item1.text
#		quando a batalha terminar usa essa linha de codigo pra salvar todos os itens nao usados
		inv['slot1'] = ''
		ativar_texto(item1,textos['ovo'],false)
		add_vida(6)
	elif item1.text == 'outro_item':
		pass
#		quando adcionar novos items coloca aqui

func _on_item_2_pressed() -> void:
	$coluna1/item2.focus_mode = Control.FOCUS_NONE
	if item2.text == 'ovo':
		inv['slot2'] = ''
		ativar_texto(item2,textos['ovo'],false)
		add_vida(6)
func _on_item_3_pressed() -> void:
	$coluna1/item3.focus_mode = Control.FOCUS_NONE
	if item3.text == 'ovo':
		inv['slot3'] = ''
		ativar_texto(item3,textos['ovo'],false)
		add_vida(6)

func _on_item_4_pressed() -> void:
	$coluna1/item4.focus_mode = Control.FOCUS_NONE
	if item4.text == 'ovo':
		inv['slot4'] = ''
		ativar_texto(item4,textos['ovo'],false)
		add_vida(6)

func _on_item_5_pressed() -> void:
	$coluna1/item5.focus_mode = Control.FOCUS_NONE
	if item5.text == 'ovo':
		inv['slot5'] = ''
		ativar_texto(item5,textos['ovo'],false)
		add_vida(6)

func _on_item_6_pressed() -> void:
	$coluna1/item6.focus_mode = Control.FOCUS_NONE
	if item6.text == 'ovo':
		inv['slot5'] = ''
		ativar_texto(item6,textos['ovo'],false)
		add_vida(6)
