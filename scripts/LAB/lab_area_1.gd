extends Node2D
@onready var luzes = ScriptsGlobais.luzes
var entrada = true
func troca_cena(cena):
	get_tree().change_scene_to_file(cena)
	

func _ready() -> void:
	if luzes['vermelho'] == true and luzes['amarelo'] == true and luzes['verde'] == true and luzes['azul'] == true and entrada == true:
		pass
	else:
		if ScriptsGlobais.msc_tempo == 0:
			$kris/HeWeAre.play()
		else:
			$kris/HeWeAre.play(ScriptsGlobais.msc_tempo)
	
	$kris/darkworld_idle.animation = 'right'
	$kris.darkworld = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if luzes['vermelho'] == true:
		$Porta/PORTA_FINAL_ESQ/vermelho.visible = true
	if luzes['amarelo'] == true:
		$Porta/PORTA_FINAL_ESQ/amarelo.visible = true
	if luzes['verde'] == true:
		$Porta/PORTA_FINAL_DIR/verde.visible = true
	if luzes['azul'] == true:
		$Porta/PORTA_FINAL_DIR/azul.visible = true
	if $kris.position.y < -285 and $kris.position.y > -500:
		$"decoração".z_index = 2
	else:
		$"decoração".z_index = 0

func _on_abrir_porta_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		if luzes['vermelho'] == true and luzes['amarelo'] == true and luzes['verde'] == true and luzes['azul'] == true and entrada == true:
			$Porta/animacao_porta.play("porta_abrindo")
			entrada = false
