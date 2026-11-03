extends Node2D
var projetil = "res://cenas/batalha/Inimigos/projetil.tscn"
var atirar: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interagir"):
		
		$projetil.position.x = $dogy.position.x - 7
		$projetil.position.y = $dogy.position.y - 2
