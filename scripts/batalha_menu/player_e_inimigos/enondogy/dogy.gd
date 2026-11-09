extends CharacterBody2D

var move:bool
var alma_pos = ScriptsGlobais.alma_pos


func _physics_process(delta: float) -> void:
	if global_position != ScriptsGlobais.alma_pos and move == true:
		velocity = alma_pos
	else:
		move = false
	move_and_slide()
	alma_pos = ScriptsGlobais.alma_pos


func _on_timer_timeout() -> void:
	move = true
	
