extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func binaryToDecimal(input1: bool, input2: bool, input3: bool, input4: bool) -> int:
	var result = 0
	if input1:
		result += 8
	if input2:
		result += 4
	if input3:
		result += 2
	if input4:
		result += 1
	return result
	
func reformatedge(pos):
	var c = get_surrounding_cells(pos)
	var u = get_cell_tile_data(0, c[1]) != null
	var r = get_cell_tile_data(0, c[0]) != null
	var d = get_cell_tile_data(0, c[3]) != null
	var l = get_cell_tile_data(0, c[2]) != null
	var c1 = [pos+Vector2i(1, 1), pos+Vector2i(-1, 1), pos+Vector2i(1, -1), pos+Vector2i(-1, -1)]
	var au = get_cell_tile_data(0, c1[0]) != null and u and r
	var ar = get_cell_tile_data(0, c1[1]) != null and u and l
	var ad = get_cell_tile_data(0, c1[2]) != null and d and r
	var al = get_cell_tile_data(0, c1[3]) != null and d and l
	var dec = binaryToDecimal(au, ar, ad, al)
	set_cell(1, pos, 0, Vector2i((dec % 4)+4, floor(dec/4)))
	print(Vector2i((dec % 4), floor(dec/4)))

func reformatcell(pos):
	var c = get_surrounding_cells(pos)
	var u = get_cell_tile_data(0, c[1]) != null
	var r = get_cell_tile_data(0, c[0]) != null
	var d = get_cell_tile_data(0, c[3]) != null
	var l = get_cell_tile_data(0, c[2]) != null
	var dec = binaryToDecimal(u, r, d, l)
	set_cell(0, pos, 0, Vector2i((dec % 4), floor(dec/4)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		var pos = local_to_map(get_local_mouse_position())
		erase_cell(0, pos)
		var c1 = [pos+Vector2i(1, 1), pos+Vector2i(-1, 1), pos+Vector2i(1, -1), pos+Vector2i(-1, -1)]
		for i in c1:
			if get_cell_tile_data(0, i) != null:
				reformatcell(i)
			elif get_cell_tile_data(1, i) != null:
				reformatedge(i)
		for i in get_surrounding_cells(pos):
			if get_cell_tile_data(0, i) != null:
				reformatcell(i)
			elif get_cell_tile_data(1, i) != null:
				reformatedge(i)
		reformatedge(pos)
