extends Node2D

var flag = false
var levanta = 0

func _ready() -> void:
	
	$kris.darkworld = true
	$kris.mover = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if levanta == 2:
		$kris/darkworld_idle.play("wake_up")
		levanta = 3
		await $kris/darkworld_idle.animation_finished
		$kris.mover = true
	
	
#	;~~~~~~~~~~~~~~~TEXTO DA ENTRADA!~~~~~~~~~~~~~~~~~~
func _on_timer_timeout() -> void:
	$kris/darkworld_idle.frame = 1
	levanta += 1
	$Timer.one_shot = true


func _on_teleporte_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		pass
