extends Control
class_name JigsawPiece


signal picked_up(centre_pos)
signal dropped(centre_pos)
signal success


export(NodePath) var ref_point : NodePath = ""
export(NodePath) var pad_point : NodePath = ""
export(float) var match_margin = 50


var is_mouse_in : bool = false
var diff_pos_mouse : Vector2 = Vector2.ZERO
var reference : Position2D = null
var original_pos : Vector2 = Vector2.ZERO
var pad_pos : Vector2 = Vector2.ZERO
var is_placed_success : bool = false


func _ready():
	set_process(false)
	
	if	get_node_or_null(ref_point) != null:
		reference = get_node(ref_point)
		
	original_pos = rect_position
	if	get_node_or_null(pad_point) != null:
		pad_pos = get_node(pad_point).position + get_node(pad_point).get_parent().rect_position


func _process(delta):
	if	Input.is_mouse_button_pressed(BUTTON_LEFT):
		rect_position = get_viewport().get_mouse_position() + diff_pos_mouse
	
	else:
		if	get_node_or_null(pad_point) != null:
			var distance_from_pad : float = (pad_pos - get_centre_pos()).length()
			if	distance_from_pad < match_margin:
				rect_position = pad_pos - rect_size/2
				is_placed_success = true
				emit_signal("success")
			
			else:
				rect_position = original_pos
			emit_signal("dropped", get_centre_pos())
		
		set_process(false)


func on_mouse_entered():
	is_mouse_in = true


func on_mouse_exited():
	is_mouse_in = false


func _input(event):
	if	!is_placed_success:
		if	event.is_pressed() and Input.is_mouse_button_pressed(BUTTON_LEFT):
				if	is_mouse_in:
					diff_pos_mouse = rect_position - get_viewport().get_mouse_position()
					set_process(true)
					emit_signal("picked_up", get_centre_pos())


func get_centre_pos() -> Vector2:
	return rect_position + rect_size/2
