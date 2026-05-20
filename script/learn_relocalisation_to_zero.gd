class_name LearnRelocalisationToZero
extends Node



@export var le_point_observer:Node3D
@export var le_plan:Node3D

@export var localized_point_observer:Vector3
@export var le_point_observer_relocalised:Node3D


func _ready():
	refresh()
func _process(delta: float) -> void:
	refresh()
	

func refresh():
	var new_position :Vector3=from_node_3d_space_to_cartesian(le_point_observer, le_plan)
	localized_point_observer = new_position
	le_point_observer_relocalised.global_transform.origin = localized_point_observer


static func from_node_3d_space_to_cartesian(point_to_observer:Node3D, node_space:Node3D)->Vector3:
	return from_node_3d_space_to_cartesian_raw(point_to_observer.global_transform.origin, node_space.global_transform.origin, Quaternion.from_euler(node_space.global_rotation))

static func from_node_3d_space_to_cartesian_raw(
	point_to_observer:Vector3,
	node_space_position:Vector3,
	node_space_rotation:Quaternion )->Vector3:

	var v3_le_point_observer_at_zero:Vector3 = point_to_observer - node_space_position
	var q_inverse_le_plan:Quaternion = node_space_rotation.inverse()
	var v3_le_point_observer_at_zero_and_rotated:Vector3 = q_inverse_le_plan * v3_le_point_observer_at_zero
	return v3_le_point_observer_at_zero_and_rotated



	
	
	
	
