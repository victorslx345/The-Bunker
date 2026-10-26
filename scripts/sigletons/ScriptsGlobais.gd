extends Node

var anim: bool = true
var msc_tempo: float

var DarkWorld: bool
var inventario = {
	'slot1': '',
	'slot2': '',
	'slot3': '',
	'slot4': '',
	'slot5': '',
	'slot6': '',
}
func add_item(item):
	for slot in inventario.keys():
		if inventario[slot] == '':
			inventario[slot] = item
			return

var Banheira_cortina: bool = false
