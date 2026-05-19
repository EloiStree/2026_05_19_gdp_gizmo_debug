@tool
class_name GizmoEulerPlayGroundThreeNodes
extends Node3D


@export_range(-360, 360, 0.01) var angle_x:float=0:
	set (value):
		angle_x = value
		refresh_state()
@export_range(-360, 360, 0.01) var angle_y:float=0:
	set (value):
		angle_y = value
		refresh_state()
@export_range(-360, 360, 0.01) var angle_z:float=0:
	set (value):
		angle_z = value
		refresh_state()

@export var node_center_check:Node3D
@export var node_x:Node3D
@export var node_y:Node3D
@export var node_z:Node3D




func _process(_delta):
	refresh_state()


func refresh_state():
	if node_x:
		node_x.rotation_degrees.x = angle_x
	if node_y:
		node_y.rotation_degrees.y = angle_y
	if node_z:
		node_z.rotation_degrees.z = angle_z
		
	if node_center_check:
		node_center_check.rotation= Vector3(deg_to_rad(angle_x), deg_to_rad(angle_y), deg_to_rad(angle_z))




func set_euler_xyz(x:float, y:float, z:float):
	angle_x = x
	angle_y = y
	angle_z = z
	refresh_state()


func set_euler_vector3(vec:Vector3):
	angle_x = vec.x
	angle_y = vec.y
	angle_z = vec.z
	refresh_state()


func set_euler_from_quaternion(quat:Quaternion):
	var euler = quat.get_euler()
	angle_x = rad_to_deg(euler.x)
	angle_y = rad_to_deg(euler.y)
	angle_z = rad_to_deg(euler.z)
	refresh_state()


func set_euler_from_direction_on_forward_unity(direction:Vector3):
	var foward_direction_start := Vector3(0, 0, -1)
	var user_direction:= direction.normalized()
	var rotation_quat: Quaternion = Quaternion.from_euler(foward_direction_start.angle_to(user_direction) * foward_direction_start.cross(user_direction).normalized())	
	set_euler_from_quaternion(rotation_quat)
