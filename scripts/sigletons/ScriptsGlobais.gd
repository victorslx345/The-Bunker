extends Node

var anim: bool = true
var msc_tempo: float
var DarkWorld: bool
var kris_status = {
	'vida_max' = 20,
	'vida' = 2,
	'dano' = 10,
	'defesa' = 0
}
#scrpit para aplicar a defesa
#dano -= (dano*kris_status['defesa'])
var inventario = {
	'slot1': 'ovo',
	'slot2': 'ovo',
	'slot3': 'ovo',
	'slot4': 'ovo',
	'slot5': 'ovo',
	'slot6': 'ovo',
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
func add_item(item):
	for slot in inventario.keys():
		if inventario[slot] == '':
			inventario[slot] = item
			return

var Banheira_cortina: bool = false

var inimigo: String
