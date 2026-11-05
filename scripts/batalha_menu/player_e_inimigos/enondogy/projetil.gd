extends Area2D

var posicao_x
var posicao_y
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	posicao_y = randf_range(-0.5,0.5)
	posicao_x = -1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(posicao_x)
	move_local_y(posicao_y)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		SingnalManager.dano.emit()
