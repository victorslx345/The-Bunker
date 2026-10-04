extends Node2D

var flag = false
var levanta = 0

func _ready() -> void:
	if ScriptsGlobais.anim == true:
		$kris/darkworld_idle.animation = 'wake_up'
		$kris.mover = false
		$Timer.start()
	$kris.darkworld = true
	if ScriptsGlobais.msc_tempo > 0:
		$kris/HeWeAre.play(ScriptsGlobais.msc_tempo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if levanta == 2:
		$kris/darkworld_idle.play("wake_up")
		levanta = 3
		$kris/wing.play()
		await $kris/darkworld_idle.animation_finished
		$kris.mover = true

	
	
func _on_timer_timeout() -> void:
	$kris/darkworld_idle.frame = 1
	levanta += 1
	$Timer.one_shot = true
	$kris/bump.play()
