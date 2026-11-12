extends Node2D

@onready var dialogo = $"../kris/CanvasLayer/text_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interact_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = 'O vidro esta muito sujo para conseguir ver seu reflexo direito.\nSeu reflexo sorriu.'
		dialogo.can_play = true

func _on_interact_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false


func _on_desenho_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = 'Ha um desenho de uma arvore entre as salas.'
		dialogo.can_play = true


func _on_desenho_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
