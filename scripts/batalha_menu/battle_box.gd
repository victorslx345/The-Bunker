extends Control

@export var comecar_batalha: bool
@export var terminar_batalha: bool
@export var tempo: int
@export var comeca_ataque: bool
@export var desliga_ataque: bool
@onready var No_mae = $".."
#func inicio_batalha(flag:bool):
	#if flag == true:
		#flag = false
		#visible = true
		#$sprite.play("abrindo")
		#await $sprite.animation_finished
		#$alma.Controle = true
		#$alma.visible = true
#func fim_batalha(flag:bool):
	#if flag == true:
		#flag = false
		#$alma.visible = false
		#$sprite.play("fechando")
		#await $sprite.animation_finished
		#$alma.Controle = false
		#visible = false
# Called when the node enters the scene tree for the first time.
#@onready var timer = get_tree().create_timer(tempo)
@export var timer: int
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug"):
		terminar_batalha = true
	if No_mae.fim == false:
		if comecar_batalha == true:
			$"../acts_hud".modo = 'lutando'
			comecar_batalha = false
			$"../hud".visible = true
			$"../hud/text_container".hide()
			visible = true
			$sprite.play("abrindo")
			await $sprite.animation_finished
			comeca_ataque = true
			SingnalManager.batalha_comeca.emit()
			$alma.position = Vector2(0,0)
			$alma/hitbox.disabled = false
			$alma.Controle = true
			$alma.visible = true
			$"../acoes_hud/ataque_hud/barra/hitbox".disabled = true
			await get_tree().create_timer(timer).timeout
			terminar_batalha = true
			comeca_ataque = false
			SingnalManager.batalha_termina.emit()
		if terminar_batalha == true:
			comeca_ataque = false
			desliga_ataque = true
			terminar_batalha = false
			$alma.visible = false
			$alma/hitbox.disabled = true
			$sprite.play("fechando")
			await $sprite.animation_finished
			desliga_ataque = false
			$alma.Controle = false
			visible = false
			$"..".dialogo_turnos_cont += 1
			$"..".turnos += 1
			SingnalManager.turno.emit()
			$"../acts_hud".modo = 'acao'
			$"../acts_hud/botoes/atacar".grab_focus()
			$"../hud/text_container".visible = true
			$"../hud/text_container/texto".visible = true
			$"..".mudar_dialogo = true
			$"../acts_hud".desativar_botoes(false)
