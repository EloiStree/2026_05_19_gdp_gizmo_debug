@tool
extends Node3D


@export var use_test:bool = false
@export var euler_gizmo:GizmoEulerPlayGroundThreeNodes
@export var point_to_track:Node3D


func _process(_delta):
	if not euler_gizmo or not point_to_track:
		return
	if not use_test:
		return


	euler_gizmo.set_euler_from_direction_on_forward_unity(point_to_track.global_transform.origin)
