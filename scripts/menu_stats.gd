extends Control

var botao : Button
var inv = ScriptsGlobais.inventario
@export var foco: bool
@export var pode_abrir : bool

func item(item,slots: Button):
	for slot in ScriptsGlobais.inventario.keys():
		if ScriptsGlobais.inventario[slot] != '' and ScriptsGlobais.inventario[slot] != 'retirado':
			slots.text += ScriptsGlobais.inventario[slot]
			slots.visible = true
			ScriptsGlobais.inventario[slot] = 'retirado'
			return

func _ready() -> void:
	item(ScriptsGlobais.inventario,$Itens/Coluna1/VBoxContainer/item6)
	item(inv,$Itens/Coluna1/VBoxContainer/item4)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if foco == true:
		pass

func _on_itens_pressed() -> void:
	$menu.visible = false
	$Itens.visible = true
	print('a')


func _on_voltar_pressed() -> void:
	$menu.visible = true
	$Itens.visible = false
