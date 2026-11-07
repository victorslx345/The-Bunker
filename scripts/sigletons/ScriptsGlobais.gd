extends Node

var anim: bool = true
var msc_tempo: float
var DarkWorld: bool
@export var kris_status = {
	'vida_max' : 20,
	'vida' : 20,
	'dano' : 10,
	'defesa' : 0,
	'alma_pos_x' : 0
}
#scrpit para aplicar a defesa
#dano -= (dano*kris_status['defesa'])
var inventario = {
	'slot1': '',
	'slot2': '',
	'slot3': '',
	'slot4': '',
	'slot5': '',
	'slot6': '',
}
var inventario_save = {
	'slot1': '',
	'slot2': '',
	'slot3': '',
	'slot4': '',
	'slot5': '',
	'slot6': '',
}
var luzes = {
	'vermelho' = false,
	'amarelo' = false,
	'verde' = false,
	'azul' = false
}
var chaves = {
	'vermelho' = false,
	'amarelo' = false,
	'verde' = false,
	'azul' = false
}
var itens = {
	'ovo' : false,
	'salgadinho' : false,
	'miojo' : false
	
}
func add_item(item):
	for slot in inventario.keys():
		if inventario[slot] == '':
			inventario[slot] = item
			return

var Banheira_cortina: bool = false

var inimigo: String
