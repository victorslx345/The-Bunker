extends Node2D

var cont = 0
var flag = 0
@export var texto = preload("res://cenas/text_box.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if flag == 1 and Input.is_action_just_pressed("interagir"):
		var Dialogo = texto.instantiate();
		add_child(Dialogo)
		$"../Entrada1/hitbox".disabled
		$"../kris".mover = false




func _on_entrada_1_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = 1
		print('entrei')


func _on_entrada_1_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		flag = 0
		print('sai')
