extends Node2D

var flag:bool
var controle:bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScriptsGlobais.DarkWorld = true
	$cenario/kris.darkworld = ScriptsGlobais.DarkWorld


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if flag == true and Input.is_action_just_pressed('interagir') and controle == true:
		flag = false
		controle = false
		$cutscene.play("fim")
		$sfx/SndTempbell.play()

func _on_interact_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = true


func _on_interact_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		flag = false
