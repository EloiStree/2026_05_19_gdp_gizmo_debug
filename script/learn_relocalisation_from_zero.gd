@tool
class_name LearnRelocalisationFromZero
extends Node


@export var le_point_observer_at_zero:Node3D
@export var le_plan:Node3D

@export var le_point_observer_relocalised:Node3D

func _ready():
	refresh()


func _process(delta):
		refresh()

func refresh():
	if le_point_observer_at_zero and le_plan and le_point_observer_relocalised:
		var global_Position = from_cartesian_to_node_3d_space(le_point_observer_at_zero, le_plan)
		le_point_observer_relocalised.global_transform.origin = global_Position

static func from_cartesian_to_node_3d_space(local_point:Node3D, node_destination:Node3D) -> Vector3:
	return from_cartesian_to_node_3d_space_raw(local_point.global_transform.origin, node_destination.global_transform.origin, Quaternion.from_euler(node_destination.global_rotation))

static func from_cartesian_to_node_3d_space_raw(local_point:Vector3, node_position:Vector3, node_rotation:Quaternion) -> Vector3:
	var v3_node:Vector3 = node_position
	var q_node:Quaternion = node_rotation
	var q_inverse_node:Quaternion = q_node
	var local_point_rotated:Vector3 = q_inverse_node * local_point
	var local_point_rotated_and_translated:Vector3 = local_point_rotated + v3_node
	return local_point_rotated_and_translated
