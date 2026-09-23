extends Node2D

var flag = false
func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if flag == true and Input.is_action_pressed("interagir"):
		$brilho.visible = false
		$cenario/Porta.visible = false
		if $detector.position.x < 1000:
			$detector.move_local_x(10)


func _on_brilho_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = true
