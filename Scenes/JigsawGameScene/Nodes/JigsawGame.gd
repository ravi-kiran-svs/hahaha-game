extends Control
class_name JigsawGame


signal all_pieces_solved


var num_pieces_solved : int = 0


onready var jigsaw_pieces : Node = $JigsawPieces
onready var total_jigsaw_pieces : int = jigsaw_pieces.get_child_count()


func _ready():
	for	jigsaw in jigsaw_pieces.get_children():
		jigsaw = jigsaw as JigsawPiece
		jigsaw.connect("success", self, "on_jigsaw_success")


func on_jigsaw_success():
	num_pieces_solved += 1
	if	num_pieces_solved == total_jigsaw_pieces:
		emit_signal("all_pieces_solved")
