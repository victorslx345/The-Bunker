extends Node2D

#90G = esquerda, 180 = cima, 270 = direita
var blaster = preload("res://cenas/batalha/Inimigos/blaster_1.tscn")
var ataque:int
var conecta:bool
var guarda_ataque
@onready var mark1 = $Marker1
@onready var mark2 = $Marker2
func gaster_blast():
	var Gaster_Blaster1 = blaster.instantiate()
	Gaster_Blaster1.position = $Marker1.position
	Gaster_Blaster1.global_rotation = $Marker1.rotation
	var Gaster_Blaster2 = blaster.instantiate()
	Gaster_Blaster2.position = $Marker2.position
	Gaster_Blaster2.global_rotation = $Marker2.rotation
	add_child(Gaster_Blaster1)
	add_child(Gaster_Blaster2)
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../..".turno != 4:
		conecta = true
	if $"../..".turno == 4 and conecta == true:
		conecta = false
		SingnalManager.lazer.connect(gaster_blast)
		#ataque = 5
		ataque = randi_range(1,6)
		guarda_ataque = ataque
	if ataque == 5:
		mark1.position = Vector2(101.667,107.667)
		mark2.position = Vector2(284.667,127.333)
		mark1.rotation = 4.71238899230957
		mark2.rotation = 1.57079637050629
	if ataque == 2:
		mark1.position = Vector2(101.667,28.0)
		mark2.position = Vector2(284.667,28.0)
		mark1.rotation = 5.50887365341187
		mark2.rotation = 0.83775806427002
	if ataque == 6:
		mark1.position = Vector2(187.333,191.0)
		mark2.position = Vector2(284.667,117.333)
		mark1.rotation = 3.14159274101257
		mark2.rotation = 1.57079637050629
	if ataque == 4:
		mark1.position = Vector2(101.667,84.667)
		mark2.position = Vector2(284.667,146.0)
		mark1.rotation = 4.71238899230957
		mark2.rotation = 1.57079637050629
	if ataque == 1:
		mark1.position = Vector2(152.333,35.0)
		mark2.position = Vector2(220.333,35.0)
		mark1.rotation = 0
		mark2.rotation = 0
	if ataque == 3:
		mark1.position = Vector2(176.198,35.0)
		mark2.position = Vector2(201.478,35.0)
		mark1.rotation = 0
		mark2.rotation = 0

	while guarda_ataque == ataque:
		ataque = randi_range(1,6)



func _on_timer_timeout() -> void:
	gaster_blast()
	guarda_ataque = ataque
