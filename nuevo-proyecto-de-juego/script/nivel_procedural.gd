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
	
	
	if  event.is_action_pressed("tile4"):
		var nx = randi_range(-4,4)
		var nz = randf_range(-4,4)
		var _Loceta = randf_range(0,7)
		terreno._cambia_loceta(nx,nz,_Loceta)
		

	if  event.is_action_pressed("tile5"):
		terreno._generate_world()
		
