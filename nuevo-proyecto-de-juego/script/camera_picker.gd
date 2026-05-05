extends Camera3D
class_name  CAMERA_PICKER
@onready var ray_cast_3d: RayCast3D = $RayCast3D
signal  celda_seleccionada(_cell:Vector3i,_collision_point:Vector3)
#@export var tipo_loceta: gridprocedural.elocetas = gridprocedural.elocetas.Relleno
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
#	la variable mouse obtiene la vista de la pantalla y con eso optiene la posicion del mouse
#	es siempre 2d por que el 3d no existe son los papas no se poner comas xd 
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
#	la posicion del rayo tendra la posicion del mouse, basicamente va apuntar a donde este el mouse
	
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100
#	fuerza para actualizar la posicion 
	#ray_cast_3d.force_raycast_update()
	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = collider.local_to_map(collision_point)
			if Input.is_action_just_pressed("cambio_celda"):
				celda_seleccionada.emit(cell,collision_point)
				#collider.set_cell_item(cell,tipo_loceta)
