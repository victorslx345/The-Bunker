extends Node2D

@export var turno: int = 1
@export var começar:bool
var rodar = true
func add_turno():
	turno +=1
	return
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SingnalManager.turno.connect(add_turno)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if turno > 4:
		turno = 1
	if rodar == true and Input.is_action_just_pressed('1'):
		turno = 1
	if rodar == true and Input.is_action_just_pressed('2'):
		turno = 2
	if rodar == true and Input.is_action_just_pressed('3'):
		turno = 3
	if rodar == true and Input.is_action_just_pressed('4'):
		turno = 4
	if rodar == true and Input.is_action_just_pressed('5'):
		turno = 5
	if rodar == true and Input.is_action_just_pressed('q'):
		SingnalManager.batalha_comeca.emit()
	if rodar == true and Input.is_action_just_pressed('w'):
		SingnalManager.batalha_termina.emit()
