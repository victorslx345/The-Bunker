extends Node
@onready var padrao1 = $"../dog_amalgamate/padrao de ataque/padrao1"
@onready var inimigo = $"../dog_amalgamate"
@onready var menu = $".."
@onready var battle_box = $"../battle_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu.vida_inimigo = inimigo.Status['Vida']
	menu.vida_total_inimigo = inimigo.Status['Vida_max']
	menu.nome_inimigo = inimigo.Status['Nome']
	menu.dialogo_turnos['turno1'] += inimigo.turnos['turno1']
	menu.dialogo_turnos['turno2'] += inimigo.turnos['turno2']
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if menu.turnos == 1:
		$"../battle_box".timer = padrao1.tempo
		inimigo.liga_padrao1 = battle_box.comeca_ataque
		inimigo.desliga_padrao1 = battle_box.desliga_ataque
