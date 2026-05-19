@tool
class_name GizmoChangeColorMeshInstanceTool
extends Node3D

@export var color:Color:
	set(value):
		color = value
		_update_color()

@export var target_mesh:MeshInstance3D

func _ready():
	_update_color()

func _update_color():
	if not target_mesh:
		return
	
	var material = target_mesh.get_active_material(0)
	if not material:
		material = StandardMaterial3D.new()
		target_mesh.set_surface_override_material(0, material)
	
	material.albedo_color = color
