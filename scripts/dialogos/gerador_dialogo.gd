extends Node2D

var na_area : bool
@export var terminou : bool
@export var caixa = preload("res://cenas/text_box.tscn")

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if na_area == true and Input.is_action_just_pressed("interagir"):
		var dialogo = caixa.instantiate();
		add_child(dialogo)

func _on_entrada_1_body_entered(body: Node2D) -> void:
	na_area = true


func _on_entrada_1_body_exited(body: Node2D) -> void:
	na_area = false
