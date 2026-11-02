extends Control

@export var comecar_batalha: bool
@export var terminar_batalha: bool
@export var tempo: int
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
@onready var timer = get_tree().create_timer(tempo)
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug"):
		terminar_batalha = true
	if comecar_batalha == true:
		comecar_batalha = false
		visible = true
		$sprite.play("abrindo")
		await $sprite.animation_finished
		$alma.Controle = true
		$alma.visible = true
		$"../acoes_hud/ataque_hud/barra/hitbox".disabled = true
		await timer.timeout
		terminar_batalha = true
	if terminar_batalha == true:
		terminar_batalha = false
		$alma.visible = false
		$sprite.play("fechando")
		await $sprite.animation_finished
		$alma.Controle = false
		visible = false
		$"..".turnos += 1
		$"../acts_hud/botoes/atacar".grab_focus()
