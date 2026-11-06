extends Node2D
var comecar:bool
var terminar:bool
var conecta:bool
var explosao = preload("res://cenas/batalha/Inimigos/explosao.tscn")

var pos_x = randf_range(-129,126)
var pos_y = randf_range(-119,136)
func comecar_batalha():
	comecar = true
	visible = true
	return

func terminar_batalha():
	terminar = true
	hide()
	return
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".turno == 2 and conecta == true:
		conecta = false
		SingnalManager.batalha_comeca.connect(comecar_batalha)
		SingnalManager.batalha_termina.connect(terminar_batalha)
	if $"..".turno != 2:
		conecta = true
	if $"..".turno == 2:
		pos_x = randi_range(150,250)
		pos_y = randi_range(75,170)
		if comecar == true:
			comecar = false
			$Timer.start()
		if terminar == true:
			terminar = false
			$Timer.stop()


func _on_timer_timeout() -> void:
	var explode = explosao.instantiate()
	print('explode')
	explode.position.x = pos_x
	explode.position.y = pos_y
	add_child(explode)
