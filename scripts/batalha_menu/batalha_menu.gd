extends Control

@export var turnos: int = 1
var guarda_turno

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$sfx/AmalgamMp3160k.play()
	$acts_hud/botoes/atacar.grab_focus()
	guarda_turno = turnos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if turnos > guarda_turno:
		guarda_turno = turnos
		$acts_hud.desativar_botoes(false)
		$hud.visible = true


func _on_button_pressed() -> void:
	print('a')
