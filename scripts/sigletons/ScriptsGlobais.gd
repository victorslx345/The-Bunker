extends Node

var anim: bool = true
var msc_tempo: float

var DarkWorld: bool
var inventario = {
	'slot1': 'ovo',
	'slot2': 'Algebra',
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
