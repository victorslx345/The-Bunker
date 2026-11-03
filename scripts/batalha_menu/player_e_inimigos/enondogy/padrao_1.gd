extends Node2D
var projetil = preload("res://cenas/batalha/Inimigos/projetil.tscn")
var atirar: bool
var parar = false
var projetil_saindo = projetil.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("interagir"):
		$dogy/sprite.play("abrindo_boca")
		await $dogy/sprite.animation_finished
		projetil_saindo.position.x = $dogy.position.x - 7
		projetil_saindo.position.y = $dogy.position.y - 2
	while parar == false:
		await get_tree().create_timer(1.0).timeout
		add_child(projetil_saindo)
		var projetil_saindo = projetil.instantiate()
