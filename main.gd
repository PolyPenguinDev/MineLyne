extends Node2D
var large = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 18:
		for y in 10:
			large.append(Vector2i(x, y))
func lar(arr):
	var lar = []
	for i in large:
		if not i in arr:
			lar.append(i)

	return lar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	'''
	if Input.is_action_just_pressed("click"):
		var p =$TileMap.local_to_map($TileMap.get_local_mouse_position())
		$TileMap.erase_cell(1, p)
		var arr =$TileMap.get_used_cells(1)
		$TileMap.clear()
		
		$TileMap.set_cells_terrain_connect(0, arr, 1, 1, true)
		print($TileMap.get_used_cells(0))
		$TileMap.set_cells_terrain_connect(0, lar(arr), 1, 1, true)
		$TileMap.set_cells_terrain_connect(1, arr, 0, 0, true)'''
		
		
