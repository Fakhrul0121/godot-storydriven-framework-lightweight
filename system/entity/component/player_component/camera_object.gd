class_name CameraObject extends Camera2D

func set_camera_limit(top: int, bottom: int, left: int, right: int):
	set_limit(SIDE_TOP, top)
	set_limit(SIDE_BOTTOM, bottom)
	set_limit(SIDE_LEFT, left)
	set_limit(SIDE_RIGHT, right)
