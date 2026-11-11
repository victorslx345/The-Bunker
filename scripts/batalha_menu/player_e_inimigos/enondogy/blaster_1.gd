extends Node2D

@export var animacao: AnimationPlayer

func dar_dano(valor):
	ScriptsGlobais.kris_status['vida'] -= valor
	SingnalManager.dano.emit()
	return
func atirar():
	$anim.play("lazer1")
	get_tree().create_timer(1).timeout
	queue_free()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SingnalManager.lazer.connect(atirar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lazer_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		dar_dano(3)
