extends CharacterBody2D

@export var velocidad = 100.0

var direccion = Vector2.ZERO
@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	direccion = Input.get_vector("a", "d", "w", "s").normalized()
	var movimiento = direccion * velocidad

	if movimiento.length() > 0:
		velocity = movimiento
		if direccion.x > 0:
			animation_player.play("caminar_derecha")
		elif direccion.x < 0:
			animation_player.play("caminar_izquierda")
		elif direccion.y < 0:
			animation_player.play("caminar_arriba")
		elif direccion.y > 0:
			animation_player.play("caminar_abajo")
	else:
		velocity = Vector2.ZERO
		animation_player.play("idle")

	move_and_slide()
	
