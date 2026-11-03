extends Container
@export var vida_max = ScriptsGlobais.kris_status['vida_max']
@export var vida = ScriptsGlobais.kris_status.get('vida')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(vida,vida_max)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	vida = ScriptsGlobais.kris_status.get('vida')
	vida_max = ScriptsGlobais.kris_status['vida_max']
	$vida_display.text = str(vida,'/',vida_max)
	
