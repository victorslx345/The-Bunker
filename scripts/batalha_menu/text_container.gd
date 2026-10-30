extends Control
@export var texto: String
@export var tempo: int = 0.04
@export var can_play: bool
var indice: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if indice == 1:
		texto = 'oi ola tudo bem com vc?'
	elif indice == 2:
		texto = 'texto mudou'
	if Input.is_action_just_pressed("interagir"):
		can_play = true
		indice += 1
	if can_play ==true:
		$texto.text = '	*'
		can_play = false
		for i in texto:
			$texto.text += i
			await get_tree().create_timer(tempo).timeout
