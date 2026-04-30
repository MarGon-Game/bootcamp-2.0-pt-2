@tool
extends Node3D
class_name gridprocedural

enum elocetas {Base, Enemigos, Entrada, Items, Limite, Relleno, Salida, Otro}
#el e (de enumerado)

@export var tipoLoceta : elocetas = elocetas.Relleno

@onready var grid_map: GridMap = $GridMap

var txt_map: String = "
XSSSSSSSSX
XXXXXXXXXX
XXXXXXXXXX
XXSXXXXSXX
XXSXXXXSXX
XXXXXXXXXX
XXSXXXXSXX
XXXSSSSXXX
XXXXXXXXXX
XXXXXXXXXX
"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_crea_cuadro()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _crea_cuadro():
	var nX 
	var nZ 
	for n_Z  in range(-5,5):
		nZ = n_Z
		for n_X in range(-5,5):
			nX = n_X
			grid_map.set_cell_item(Vector3i(nX,0,nZ), tipoLoceta,0)


func _limpiarGrid():
	grid_map.clear()
	

func _pinta_cuadro():
	grid_map._crear_cuadro()
	

func _cambia_loceta(nX: int,nZ: int, _tipoloceta: elocetas = elocetas.Relleno):
	grid_map.set_cell_item(Vector3i(nX,0,nZ), _tipoloceta,0)


func _generate_world():
	# 1. Limpiamos cualquier cuadro anterior
	_limpiarGrid()
	
	# 2. Separamos el texto grande en un arreglo, donde cada elemento es una línea
	var lineas = txt_map.strip_edges().split("\n")
	
	print(lineas)
	
	# 3. Recorremos las filas (Eje Z)
	for z in range(lineas.size()):
		var fila = lineas[z].strip_edges() # Quitamos espacios en blanco por si acaso
		
		# 4. Recorremos cada letra de la fila (Eje X)
		for x in range(fila.length()):
			var caracter = fila[x]
			
			# 5. Mapeamos tu rango original (-5 a 4) 
			# Como x y z van de 0 a 9, le restamos 5 para centrarlo en el origen (0,0,0)
			var nX = x - 5
			var nZ = z - 5
			
			# 6. Decidimos qué loceta pintar según el caracter usando 'match' (el switch de Godot)
			var loceta_a_pintar = elocetas.Relleno # Valor por defecto
			
			match caracter:
				"X":
					loceta_a_pintar = elocetas.Relleno # o elocetas.Base, según tu diseño
				"1":
					loceta_a_pintar = elocetas.Entrada
				"S":
					loceta_a_pintar = elocetas.Salida
				_:
					loceta_a_pintar = elocetas.Otro # Por si hay un error en el texto
					
			# 7. Pintamos en el GridMap
			grid_map.set_cell_item(Vector3i(nX, 0, nZ), loceta_a_pintar, 0)
