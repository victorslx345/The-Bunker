extends Node2D

func troca_cena(cena):
	get_tree().change_scene_to_file(cena)
	

func _ready() -> void:
	$kris/HeWeAre.play()
	$kris/darkworld_idle.animation = 'right'
	$kris.darkworld = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lab_inicial_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		troca_cena("res://cenas/TRUE_LAB/lab_incial.tscn")
