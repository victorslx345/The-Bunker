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
	'ovo' = '	* Voce usou o ovo e recuperou todo o HP.',
	'salgadinho' = '	* Voce usou Salgadinho e recuperou 6 de HP.',
	'miojo' = '	* Você comeu o Miojo cru... Recuperou 4 de HP.',
	'ração' = '	* Você comeu a ração... tem gosto de comida velha. Recuperou 4 de HP.'
}

func add_vida(N:int):
	ScriptsGlobais.kris_status['vida'] += N
	fechar = true
	if ScriptsGlobais.kris_status['vida'] > ScriptsGlobais.kris_status['vida_max']:
		ScriptsGlobais.kris_status['vida'] = ScriptsGlobais.kris_status['vida_max']
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
		ScriptsGlobais.inventario_save['slot1'] = item1.text
		inv['slot1'] = ''
		ativar_texto(item1,textos['ovo'],false)
		add_vida(20)
	elif item1.text == 'salgadinho':
		inv['slot1'] = ''
		ativar_texto(item1,textos['salgadinho'],false)
		add_vida(6)
	elif item1.text == 'miojo':
		inv['slot1'] = ''
		ativar_texto(item1,textos['miojo'],false)
		add_vida(4)
	elif item1.text == 'ração':
		inv['slot1'] = ''
		ativar_texto(item1,textos['ração'],false)
		add_vida(4)


func _on_item_2_pressed() -> void:
	$coluna1/item2.focus_mode = Control.FOCUS_NONE
	if item2.text == 'ovo':
		inv['slot2'] = ''
		ativar_texto(item2,textos['ovo'],false)
		add_vida(20)
	elif item2.text == 'salgadinho':
		inv['slot2'] = ''
		ativar_texto(item2,textos['salgadinho'],false)
		add_vida(6)
	elif item2.text == 'miojo':
		inv['slot2'] = ''
		ativar_texto(item2,textos['miojo'],false)
		add_vida(4)
	elif item2.text == 'ração':
		inv['slot2'] = ''
		ativar_texto(item2,textos['ração'],false)
		add_vida(4)
func _on_item_3_pressed() -> void:
	$coluna1/item3.focus_mode = Control.FOCUS_NONE
	if item3.text == 'ovo':
		inv['slot3'] = ''
		ativar_texto(item3,textos['ovo'],false)
		add_vida(20)
	elif item3.text == 'salgadinho':
		inv['slot3'] = ''
		ativar_texto(item3,textos['salgadinho'],false)
		add_vida(6)
	elif item3.text == 'miojo':
		inv['slot3'] = ''
		ativar_texto(item3,textos['miojo'],false)
		add_vida(4)
	elif item3.text == 'ração':
		inv['slot3'] = ''
		ativar_texto(item3,textos['ração'],false)
		add_vida(4)
func _on_item_4_pressed() -> void:
	$coluna1/item4.focus_mode = Control.FOCUS_NONE
	if item4.text == 'ovo':
		inv['slot4'] = ''
		ativar_texto(item4,textos['ovo'],false)
		add_vida(20)
	elif item4.text == 'salgadinho':
		inv['slot4'] = ''
		ativar_texto(item4,textos['salgadinho'],false)
		add_vida(6)
	elif item4.text == 'miojo':
		inv['slot4'] = ''
		ativar_texto(item4,textos['miojo'],false)
		add_vida(4)
	elif item4.text == 'ração':
		inv['slot4'] = ''
		ativar_texto(item4,textos['ração'],false)
		add_vida(4)
func _on_item_5_pressed() -> void:
	$coluna1/item5.focus_mode = Control.FOCUS_NONE
	if item5.text == 'ovo':
		inv['slot5'] = ''
		ativar_texto(item5,textos['ovo'],false)
		add_vida(20)
	elif item5.text == 'salgadinho':
		inv['slot5'] = ''
		ativar_texto(item5,textos['salgadinho'],false)
		add_vida(6)
	elif item5.text == 'miojo':
		inv['slot5'] = ''
		ativar_texto(item5,textos['miojo'],false)
		add_vida(4)
	elif item5.text == 'ração':
		inv['slot5'] = ''
		ativar_texto(item5,textos['ração'],false)
		add_vida(4)
func _on_item_6_pressed() -> void:
	$coluna1/item6.focus_mode = Control.FOCUS_NONE
	if item6.text == 'ovo':
		inv['slot5'] = ''
		ativar_texto(item6,textos['ovo'],false)
		add_vida(20)
	elif item6.text == 'salgadinho':
		inv['slot6'] = ''
		ativar_texto(item6,textos['salgadinho'],false)
		add_vida(6)
	elif item6.text == 'miojo':
		inv['slot6'] = ''
		ativar_texto(item6,textos['miojo'],false)
		add_vida(4)
	elif item6.text == 'ração':
		inv['slot6'] = ''
		ativar_texto(item6,textos['ração'],false)
		add_vida(4)
