extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScriptsGlobais.DarkWorld = true
	$kris.darkworld = ScriptsGlobais.DarkWorld
	if ScriptsGlobais.msc_tempo > 0:
		$kris/HeWeAre.play(ScriptsGlobais.msc_tempo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_proximidade_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		$dialogo_labPrincipal/Entrada1/sprite.play("default")
 


func _on_proximidade_2_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		$dialogo_labPrincipal/Entrada2/sprite.play("default")
