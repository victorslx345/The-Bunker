extends Node

@onready var inimigo = $"../dog_amalgamate"
@onready var menu = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu.vida_inimigo = inimigo.Status['Vida']
	menu.vida_total_inimigo = inimigo.Status['Vida_max']
	menu.nome_inimigo = inimigo.Status['Nome']
	menu.dialogo_turnos['turno1'] += inimigo.turnos['turno1']
	menu.dialogo_turnos['turno2'] += inimigo.turnos['turno2']

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
