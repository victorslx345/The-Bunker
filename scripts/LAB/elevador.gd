extends Node2D

var flag:bool
var controle:bool = true
var voa:bool
var cai:bool
var time = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScriptsGlobais.DarkWorld = true
	$cenario/kris.darkworld = ScriptsGlobais.DarkWorld
	$cenario/kris/darkworld_idle.play("up")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if voa == true:
		voa = false
		var i = 40
		var j = 0
		while j < i:
			j += 1
			$cenario/kris.position.y += -2
			await get_tree().create_timer(time).timeout
	if cai == true:
		cai = false
		var p = 40
		var l = 0
		while l < p:
			l += 1
			$cenario/kris.position.y += 2.5
			await get_tree().create_timer(time*0.1).timeout
		$sfx/Impact.play()
		await get_tree().create_timer(0.1).timeout
		$cenario.visible = false
		$luz.play("some")
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://cenas/creditos.tscn")
	if flag == true and Input.is_action_just_pressed('interagir') and controle == true:
		flag = false
		controle = false
		$cutscene.play("fim")
		$sfx/SndTempbell.play()
		await get_tree().create_timer(1).timeout
		$cutscene.play("elevador")
		await get_tree().create_timer(7.5).timeout
		$luz.play("luzes")
		await get_tree().create_timer(0.4).timeout
		voa = true
		$cenario/kris/hitbox.disabled = true
		await get_tree().create_timer(4).timeout
		cai = true
func _on_interact_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = true


func _on_interact_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		flag = false
