extends Control

var vai = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(1).timeout
	vai = true
	$AnimationPlayer.play("avança")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if vai == true:
		if Input.is_action_just_pressed("interagir"):
			get_tree().change_scene_to_file("res://cenas/bunker.tscn")
