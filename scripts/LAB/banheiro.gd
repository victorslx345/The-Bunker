extends Node2D

var torneira1 : bool
var torneira2 : bool
var torneira1ligada : bool
var torneira2ligada : bool
var cortina : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$kris.darkworld = true
	torneira1ligada = false
	torneira2ligada = false
	$kris.z_index = 2
	if ScriptsGlobais.msc_tempo == 0:
		$kris/HeWeAre.play()
	else:
		$kris/HeWeAre.play(ScriptsGlobais.msc_tempo)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if torneira1 == true and Input.is_action_just_pressed("interagir") and torneira1ligada == false:
		$pia/pia1/torneira.visible = true
		$pia/pia1/SinkNoise.play()
		get_tree().create_timer(0.2)
		torneira1ligada = true
		print('ligou')
	elif torneira1 == true and Input.is_action_just_pressed("interagir") and torneira1ligada == true:
		$pia/pia1/torneira.visible = false
		$pia/pia1/SinkNoise.stop()
		get_tree().create_timer(0.2)
		torneira1ligada = false
		print('desligou')

	if torneira2 == true and Input.is_action_just_pressed("interagir") and torneira2ligada == false:
		$pia/pia2/torneira.visible = true
		$pia/pia2/SinkNoise.play()
		get_tree().create_timer(0.2)
		torneira2ligada = true
		print('ligou')
	elif torneira2 == true and Input.is_action_just_pressed("interagir") and torneira2ligada == true:
		$pia/pia2/torneira.visible = false
		$pia/pia2/SinkNoise.stop()
		get_tree().create_timer(0.2)
		torneira2ligada = false
		print('desligou')
#~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	if cortina == true and Input.is_action_just_pressed("interagir") and ScriptsGlobais.Banheira_cortina == false:
#		aparece um monstro
		$AnimationPlayer.play("Banheira")
		ScriptsGlobais.Banheira_cortina = true
		$Banheira/MusDisturbing.stop()
		$Banheira/bicho.visible = false
	if ScriptsGlobais.Banheira_cortina == false and $Banheira/MusDisturbing.playing == false:
		$Banheira/MusDisturbing.play()
		$Banheira/bicho.visible = true
func _on_pia_1_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		torneira1 = true


func _on_pia_1_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		torneira1 = false


func _on_pia_2_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		torneira2 = true

func _on_pia_2_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		torneira2 = false


func _on_interacao_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		cortina = true


func _on_interacao_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		cortina = false
