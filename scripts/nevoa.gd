extends ParallaxBackground

@export var velocidade = 50
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_base_offset.x -= velocidade * delta
	scroll_base_offset.y -= (velocidade/2) * delta
