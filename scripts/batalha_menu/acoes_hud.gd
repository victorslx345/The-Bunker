extends Control

@onready var animacao = $ataque_hud/AnimationPlayer
@onready var act = $"../acts_hud"
@onready var bicho = $"../bicho_info/VBoxContainer/bicho"
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bicho_pressed() -> void:
	$"../sfx/SndSelect".play()
	if $"../acts_hud".acao == 'atacar':
		$"../bicho_info/VBoxContainer/bicho".release_focus()
		$"../acts_hud".modo = 'atacando'
		$ataque_hud.visible = true
		$"../hud".visible = false
		$"../bicho_info/VBoxContainer/bicho".disabled = true
		animacao.play("medidor_fade_in")
		await get_tree().create_timer(0.5).timeout
		$ataque_hud.barra = true
		$ataque_hud.timing_do_ataque = true
	elif act.acao == 'agir':
		act.modo = 'agindo'
		$agir_hud.visible = true
		$"../hud/text_container".visible = false
		$"../bicho_info".visible = false
		bicho.disabled = true
		bicho.mouse_filter = 1
		$agir_hud/coluna1/acao1.grab_focus()
	elif act.acao == 'item':
		act.modo = 'item'
		$"../hud/text_container".visible = false
		$"../bicho_info".visible = false
		bicho.disabled = true
		$agir_hud/coluna1/acao1.mouse_filter = 1
		$agir_hud/coluna1/acao1.disabled = true
