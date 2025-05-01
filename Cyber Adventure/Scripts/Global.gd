extends Node

var Ruta: String = "user://game_data.dat"
var Data: Dictionary = {}  # Diccionario vacío para inicializar

func generar_mapa():
	# Simulación de generación procedural del mapa
	Data = {
		"TileMap": "Mapa generado proceduralmente"
	}
	print("Mapa generado: ", Data)

func Guardar() -> void:
	generar_mapa()  # Generar datos antes de guardarlos
	var archive = FileAccess.open(Ruta, FileAccess.WRITE)
	if archive == null:
		print("Error: No se pudo abrir el archivo para escribir")
		return
	archive.store_var(Data)
	archive = null
	print("Archivo guardado correctamente en: ", Ruta)

func Cargar() -> void:
	if not FileAccess.file_exists(Ruta):
		print("Error: El archivo no existe")
		return
	var archive = FileAccess.open(Ruta, FileAccess.READ)
	if archive == null:
		print("Error: No se pudo abrir el archivo para leer")
		return
	Data = archive.get_var()
	archive = null
	print("Datos cargados correctamente: ", Data)
