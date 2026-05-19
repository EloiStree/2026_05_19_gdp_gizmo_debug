@tool
class_name GizmoChangeColorMeshesInstanceTool
extends Node3D

@export var color:Color:
	set(value):
		color = value
		_update_color()

@export var target_meshes:Array[MeshInstance3D]

func _ready():
	_update_color()

func _update_color():
	if not target_meshes:
		return
	
	for i in target_meshes:
		var material = i.get_active_material(0)
		if not material:
			material = StandardMaterial3D.new()
			i.set_surface_override_material(0, material)
		
		material.albedo_color = color
