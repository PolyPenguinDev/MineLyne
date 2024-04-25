extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		var p =$TileMap.local_to_map($TileMap.get_local_mouse_position())
		$TileMap.erase_cell(0, p)
		var arr =$TileMap.get_used_cells(0)
		$TileMap.clear()
		$TileMap.set_cells_terrain_connect(0, arr, 0, 0, true)
