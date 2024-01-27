extends Control


signal all_glass_pieces_success


export(float) var time_between_turns : float = 3


onready var glass_pieces : Node = $GlassPieces


func _ready():
	for	glass_piece in glass_pieces.get_children():
		glass_piece = glass_piece as GlassPiece
		glass_piece.connect("failed", self, "on_failed")
		glass_piece.connect("success", self, "on_success")
	
	activate_random_glass_piece()


func activate_random_glass_piece():
	var glass_pieces_available : Array = []
	for	glass_piece in glass_pieces.get_children():
		glass_piece = glass_piece as GlassPiece
		if	glass_piece.current_state == GlassPiece.State.DUSKY:
			glass_pieces_available.append(glass_piece)
	
	if	glass_pieces_available.size() > 0:
		glass_pieces_available[randi() % glass_pieces_available.size()].activate(time_between_turns)


func on_failed():
	activate_random_glass_piece()


func on_success():
	var n_avail_pieces : int = 0
	for	glass_piece in glass_pieces.get_children():
		glass_piece = glass_piece as GlassPiece
		if	glass_piece.current_state == GlassPiece.State.DUSKY:
			n_avail_pieces += 1
	
	if	n_avail_pieces > 0:
		activate_random_glass_piece()
	
	else:
		emit_signal("all_glass_pieces_success")
