extends Control

const dialogs_npc = {
	0: [
		"Hola y Bienvenido a Cyber Adventure, un juego educativo y emocionante donde aprenderás las bases de la informática",
		"Yo soy el NPC 0",
		"¿Y tú cómo te llamas?",
		"...............",
		"¡¡¡Hola!!!",
		"¿Estás ahí?",
		"Qué mal :,("
	],

	1: [
		"¿Quién eres?",
		"Soy NPC 1",
		"No te conozco"
	],
}

var dialogs_index
var current_npc
var tween: Tween
@onready var label = $RichTextLabel

func _ready():
	visible = false
	

func start(npc_id):
	visible = true
	dialogs_index = 0
	current_npc = npc_id
	speak()

func speak():
	label.visible_ratio = 0
	label.text = dialogs_npc[current_npc][dialogs_index]
	tween = create_tween()
	var animation_speed = 0.05 * label.text.length()
	tween.tween_property(label, "visible_ratio", 1, animation_speed)
	dialogs_index += 1

func next():
	if tween.is_running():
		tween.kill()
		label.visible_ratio = 1
		return

	if dialogs_index < dialogs_npc[current_npc].size():
		speak()
	else:
		visible = false

func _input(event):
	if event.is_action_released("ui_accept"):
		next()

func _on_button_pressed():
	next()

