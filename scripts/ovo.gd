extends Node2D

var musica: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	musica = randi_range(1,5)
	if musica != 1:
		$kris/Man.play()
	else:
		$kris/DeltarunePianoCollectionsByTrevorAlanGomes.play()
	print(musica)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $kris.position.y <= 137:
		$Arvore/tronco.z_index = 2
	else:
		$Arvore/tronco.z_index = 1
