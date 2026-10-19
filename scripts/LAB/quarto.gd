extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$kris/darkworld_idle.animation = 'up'
	$kris.darkworld = true
	if ScriptsGlobais.msc_tempo == 0:
		$kris/HeWeAre.play()
	else:
		$kris/HeWeAre.play(ScriptsGlobais.msc_tempo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
