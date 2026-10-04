extends AudioStreamPlayer2D

@export var tempo: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ScriptsGlobais.msc_tempo = get_playback_position()
