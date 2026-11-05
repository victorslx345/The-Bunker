extends Node2D
var tempo: int
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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rand == 1:
		pass
