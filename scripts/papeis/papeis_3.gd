extends AnimatedSprite2D


func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:


	if $"../papeis".treme == 0.5 and $"../papeis".cair == false:
		move_local_x(0.5)
	if $"../papeis".treme == -0.5 and $"../papeis".cair == false:
		move_local_x(-0.5)
	if $"../papeis".cair == true:
		play("caindo")
		move_local_y(1*randi_range(1,2))
