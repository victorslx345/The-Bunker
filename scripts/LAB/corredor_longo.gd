extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$kris/darkworld_idle.animation = 'up'
	$kris.darkworld = true
	if ScriptsGlobais.derrotou == false:
		$kris.position = Vector2(565.0,519.0)
	else:
		$kris.position = ScriptsGlobais.kris_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScriptsGlobais.derrotou == false:
		ScriptsGlobais.kris_pos = $kris.position
