@tool
extends Node3D
class_name nivel_procedural

@onready var terreno : gridprocedural = $Terreno


func _input(event: InputEvent) -> void:
	if  event.is_action_pressed("pinta_cuadro"):
		terreno._crea_cuadro()
		
	if  event.is_action_pressed("limpiar_grid"):
		terreno._limpiarGrid()
		
	if  event.is_action_pressed("tile1"):
		terreno.tipoLoceta = gridprocedural.elocetas.Base
		terreno._crea_cuadro()
		
	if  event.is_action_pressed("tile2"):
		terreno.tipoLoceta = gridprocedural.elocetas.Enemigos
		terreno._crea_cuadro()
		
	if  event.is_action_pressed("tile3"):
		terreno.tipoLoceta = gridprocedural.elocetas.Limite
		terreno._crea_cuadro()
	
	#if
