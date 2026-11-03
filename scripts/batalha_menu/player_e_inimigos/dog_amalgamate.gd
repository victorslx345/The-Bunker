extends Node2D

@export var Status = {
	'Nome' : 'Enondogy',
	'Vida' : 70,
	'Vida_max' : 70
}
@export var turnos = {
	'turno1' : str('Enondogy apareceu.'),
	'turno2' : str('Um cheiro esquisito enchi o ar')
}
@export var liga_padrao1: bool
@export var desliga_padrao1: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
