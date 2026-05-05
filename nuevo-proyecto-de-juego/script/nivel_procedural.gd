@tool
extends Node3D
class_name nivel_procedural

@onready var terreno : gridprocedural = $Terreno
@onready var camera_picker: CAMERA_PICKER = $CameraPicker
@onready var lb_loceta: Label = $CanvasLayer/lbLoceta


func _input(event: InputEvent) -> void:
	if  event.is_action_pressed("pinta_cuadro"):
		terreno._crea_cuadro()
		
	if  event.is_action_pressed("limpiar_grid"):
		terreno._limpiarGrid()
		
	if  event.is_action_pressed("tile1"):
		terreno.tipoLoceta = gridprocedural.elocetas.Base
		#camera_picker.tipo_loceta = terreno.tipoLoceta
		#terreno._crea_cuadro()
		lb_loceta.text = str(terreno.tipoLoceta)
		
	if  event.is_action_pressed("tile2"):
		terreno.tipoLoceta = gridprocedural.elocetas.Enemigos
		#camera_picker.tipo_loceta = terreno.tipoLoceta
		lb_loceta.text = str(terreno.tipoLoceta)
		
		
		#terreno._crea_cuadro()
		
	if  event.is_action_pressed("tile3"):
		terreno.tipoLoceta = gridprocedural.elocetas.Limite
		#camera_picker.tipo_loceta = terreno.tipoLoceta 
		lb_loceta.text = str(terreno.tipoLoceta)
		
		#terreno._crea_cuadro()
	
	
	if  event.is_action_pressed("tile4"):
		var nx = randi_range(-4,4)
		var nz = randf_range(-4,4)
		var _Loceta = randf_range(0,7)
		terreno._cambia_loceta(nx,nz,_Loceta)
		

	if  event.is_action_pressed("tile5"):
		terreno._generate_world()
		
	if  event.is_action_pressed("eliminar_loceta"):
		terreno.tipoLoceta = -1
		#camera_picker.tipo_loceta = terreno.tipoLoceta 
		lb_loceta.text = str(terreno.tipoLoceta)
		
		


func _on_camera_picker_celda_seleccionada(_cell: Vector3i, _collision_point: Vector3) -> void:
	terreno._cambia_loceta(_cell.x,_cell.z,terreno.tipoLoceta)
