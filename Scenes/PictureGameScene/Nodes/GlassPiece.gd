extends Control
class_name GlassPiece


signal started
signal failed
signal success


enum State {DUSKY = 0, ACTIVE, SUCCESS}


export(Color) var colour_dusky : Color = Color.webpurple
export(Color) var colour_active : Color = Color.goldenrod
export(Color) var colout_success : Color = Color.transparent


var current_state : int = State.DUSKY


onready var timer : Timer = $Timer


func activate(t : float):
	set_state(State.ACTIVE)
	timer.start(t)
	emit_signal("started")


func on_timeout():
	set_state(State.DUSKY)
	emit_signal("failed")


func set_state(state : int):
	if	state == State.DUSKY:
		modulate = colour_dusky
	elif	state == State.ACTIVE:
		modulate = colour_active
	elif	state == State.SUCCESS:
		modulate = colout_success
	current_state = state


var is_mouse_in : bool = false
func on_mouse_entered():
	is_mouse_in = true
func on_mouse_exited():
	is_mouse_in = false


func _input(event):
	if	event.is_pressed() and Input.is_mouse_button_pressed(BUTTON_LEFT):
		if	is_mouse_in and current_state == State.ACTIVE:
			set_state(State.SUCCESS)
			timer.stop()
			emit_signal("success")
