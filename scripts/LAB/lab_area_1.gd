extends Node2D

func troca_cena(cena):
	get_tree().change_scene_to_file(cena)
	

func _ready() -> void:
	if ScriptsGlobais.msc_tempo == 0:
		$kris/HeWeAre.play()
	else:
		$kris/HeWeAre.play(ScriptsGlobais.msc_tempo)
	$kris/darkworld_idle.animation = 'right'
	$kris.darkworld = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
