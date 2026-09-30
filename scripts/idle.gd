extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".mover == true:
		if Input.is_action_pressed('ui_down'):
			play("default")
		elif Input.is_action_pressed('ui_up'):
			play("cima")
		elif Input.is_action_pressed('ui_right'):
			play("direita")
		elif Input.is_action_pressed('ui_left'):
			play("esquerda")
