extends Control

@onready var animacao = $AnimationPlayer
@onready var indicador_dano = $"ataque_vfx/indicador de dano"
@export var barra: bool
@export var timing_do_ataque: bool
var critico: bool
var hit: bool
var dano_teste: float = 10
#substituir essa variavel pelo dano q vai adcionar no personagem
var porcentagem: float
var dano_final
var miss: bool
@export var FIM_DO_ATAQUE: bool
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if barra == true:
		$barra/hitbox.disabled = false
		$barra.visible = true
		$barra.move_local_x(10)
		if $barra.position.x > 840 or hit == true:
			if critico == true:
				animacao.play("critico_ataque")
				critico = false
			if miss == true:
				dano_final = 'Errou'
			else:
				dano_final = str(int(dano_teste*porcentagem))
			barra = false
			hit = false
			indicador_dano.text = dano_final
			$ataque_vfx/slash.play("slash")
			$ataque_vfx/slash.visible = true
			$"../../sfx/SndLazC".play()
			await $ataque_vfx/slash.animation_finished
			$ataque_vfx/slash.visible = false
			$"ataque_vfx/indicador de dano".visible = true
			$"../../sfx/SndDamage".play()
			animacao.play("dano_popup")
			await get_tree().create_timer(1).timeout
			animacao.play("medidor_fade_out")
			await get_tree().create_timer(1).timeout
			animacao.play('dano_popout')
			visible = false
			$barra.position.x = 0
			$"../../battle_box".comecar_batalha = true

	if timing_do_ataque == true and Input.is_action_just_pressed("interagir"):
		hit = true
		timing_do_ataque = false



func _on_ruim_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'barra':
		print('ruim')
		porcentagem = randf_range(0.7,0.9)
		print(porcentagem)


func _on_mais_menos_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'barra':
		print('mais ou menos')
		porcentagem = randf_range(0.9,1.1)
		print(porcentagem)

func _on_boa_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'barra':
		print('bom')
		porcentagem = randf_range(1.1,1.3)
		print(porcentagem)
		critico = false


func _on_critico_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'barra':
		print('critico')
		porcentagem = randf_range(1.3,1.5)
		print(porcentagem)
		critico = true


func _on_errou_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'barra':
		print('errou')
		miss = true
