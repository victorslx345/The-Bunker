extends Node2D

var abre:bool
var abriu:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if abre == true and Input.is_action_just_pressed("interagir") and abriu == false:
		$anim.play("abre")
		abriu = true

func _on_interaçao_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		abre = true


func _on_interaçao_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		abre = false
