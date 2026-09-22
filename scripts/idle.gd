extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_down'):
		play("default")
	if Input.is_action_pressed('ui_up'):
		play("cima")
	if Input.is_action_pressed('ui_right'):
		play("direita")
	if Input.is_action_pressed('ui_left'):
		play("esquerda")
