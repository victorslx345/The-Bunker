extends Node2D

@export var Status = {
	'Nome' : 'ReaperBird',
	'Vida' : 150,
	'Vida_max' : 150
}
@export var turnos = {
	'turno1' : str('ReaperBird bloqueia o caminho.'),
	'turno2' : str('Esta cada vez mais dificil de respirar.')
}
@export var liga_padrao1: bool
@export var desliga_padrao1: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
