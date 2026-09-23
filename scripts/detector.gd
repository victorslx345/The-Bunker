extends Area2D

var flag = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if flag == true and Input.is_action_pressed("interagir"):
		$"../brilho".visible = false
		$"../cenario/Porta".visible = false
		move_local_x(300*delta)

func _on_brilho_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = true
