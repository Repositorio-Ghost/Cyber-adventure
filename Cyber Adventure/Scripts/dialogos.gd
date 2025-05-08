extends Control
 
const dialogs_npc = {
	0:[
		"Hola y Binvenido a Cyber Aventure, un juego educativo y emocionante donde aprenderas las bases de la informatica",
	 	"yo soy el npc 0",
		"¿y tu como te llamas?",
		"...............",
		"¡¡¡hola!!!",
		"¿estas hay?",
		"Que mal :,("
		],

	1:[
		"quien eres",
	 	"soy npc 1",
	 	"no te conosco"
		],
}

var dialogs_index
var  current_npc
@onready var label = $RichTextLabel

func _ready():
	visible = false 
	start(0)

func start(npc_id):
	visible = true
	dialogs_index = 0
	current_npc = npc_id 
	speak()


func speak():
	label.text = dialogs_npc[current_npc][dialogs_index]
	dialogs_index += 1

func next():
	if(dialogs_index < dialogs_npc[current_npc].size()):
		speak()
	else:
		visible = false

func _input(event):
	if event.is_action_released("ui_accept"):
		next()


func _on_button_pressed():  
	next()
