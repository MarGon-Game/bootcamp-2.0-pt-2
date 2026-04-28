@tool
extends Node3D
class_name gridprocedural

enum elocetas {Base, Enemigos, Entrada, Items, Limite, Relleno, Salida, Otro}
#el e (de enumerado)

@export var tipoLoceta : elocetas = elocetas.Relleno

@onready var grid_map: GridMap = $GridMap




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
