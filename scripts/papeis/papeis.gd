extends AnimatedSprite2D

var flag = false
var treme = 0
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if flag == true and Input.is_action_pressed("interagir"):
		$"../../Timer2".start()
		treme = 0.5
		$"../rumble".play()
		$"../../cair".start()
	
	if treme == 0.5:
		move_local_x(0.5)
	if treme == -0.5:
		move_local_x(-0.5)



func _on_brilho_body_entered(body: Node2D) -> void:
	flag = true


func _on_timer_2_timeout() -> void:
	
	treme *= -1


func _on_cair_timeout() -> void:
	pass
