extends Node2D
var chave:bool
var lencol:bool
@onready var dialogo = $"../kris/CanvasLayer/text_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../kris".position.y > 110:
		$lencol.z_index = 0
	else:
		$lencol.z_index = 1
	if ScriptsGlobais.chaves['amarelo'] == false:
		if lencol == true and Input.is_action_just_pressed('interagir'):
			lencol = false
			$anim.play("lencol")
			$cama.monitorable = false
			$cama.monitoring = false
			$chave/interact.monitorable = true
			$chave/interact.monitoring = true
			$chave.z_index = 1
		if chave == true and Input.is_action_just_pressed('interagir') and dialogo.fim_dial == true:
			chave = false
			$chave/interact.monitorable = true
			$chave/interact.monitoring = true
			ScriptsGlobais.chaves['amarelo'] = true
			$chave.hide()
			$"../sfx/SndItem".play()
	else:
		$lencol.position = Vector2(-90,117.75)
		$lencol.scale = Vector2(3,1.372)
		$cama.monitorable = false
		$cama.monitoring = false
		$chave/interact.monitorable = false
		$chave/interact.monitoring = false
		$chave.hide()
func _on_cama_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		lencol = true


func _on_cama_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		lencol = false


func _on_interact_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Você pegou a Chave Amarela.'
		chave = true

func _on_interact_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''
		chave = false
