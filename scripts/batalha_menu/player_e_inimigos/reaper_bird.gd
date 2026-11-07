extends Node2D
var tempo_anim = 10
var tempo: int
var controle = true
@onready var anima1 = anim1
var rand = randi_range(1,2)
func anim1(x,fim):

	$Cabeca.play("default")
	await $Cabeca.animation_finished
	$Cabeca.play("default2")
	await $Cabeca.animation_finished
	fim = true
func anim2(x,fim):
	$Cabeca.play("default")
	tempo = 5
	await get_tree().create_timer(tempo).timeout
	$Cabeca.play("default2")
	await $Cabeca.animation_finished
	fim = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("padrao")
	while true:
		await get_tree().create_timer(tempo_anim).timeout
		$AnimationPlayer.play("padrao")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rand = randi_range(1,2)
	if rand == 1 and controle == true:
		controle = false
		tempo = 3
		$Cabeca.play("default")
		await $Cabeca.animation_finished
		$Cabeca.play("default2")
		await get_tree().create_timer(tempo).timeout
		controle = true
	elif rand == 2 and controle == true:
		controle = false
		tempo = 4
		$Cabeca.play("default2")
		await $Cabeca.animation_finished
		await get_tree().create_timer(tempo).timeout
		controle = true
