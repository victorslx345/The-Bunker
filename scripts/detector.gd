extends Node2D

var levanta = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$kris/darkworld_idle.frame = 0
	#$Timer.wait_time = 3
	#$Timer.start()
	#await $Timer.is_stopped()
	#$kris/darkworld_idle.frame = 0
	#$Timer.start()
	#$Timer.wait_time = 1
	#await $Timer.is_stopped()
	#$kris/darkworld_idle.play("wake_up")
	$kris.darkworld = true
	$kris.mover = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if levanta == 2:
		$kris/darkworld_idle.play("wake_up")
		levanta = 3
		$kris.mover = true


func _on_timer_timeout() -> void:
	$kris/darkworld_idle.frame = 1
	levanta += 1
	$Timer.one_shot = true
