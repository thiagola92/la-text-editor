## Container for tabs where each tab holds a [CodeEditor].
##
## With this you can have multiple files opened and transit between which you want to see.[br][br]
class_name TabEditor
extends TabContainer


const CODE_EDITOR := preload("res://src/components/code_editor/code_editor.tscn")


func _ready():
	# Some behaviors can't be setted through TabContainer, so we need to obtain TabBar from it.
	get_tab_bar().tab_close_display_policy = TabBar.CLOSE_BUTTON_SHOW_ALWAYS
	get_tab_bar().tab_close_pressed.connect(_close_tab)
	
	child_order_changed.connect(_reload_tabs_names)
	
	_reload_tabs_names()


func _shortcut_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_tab_new"):
		_open_new_tab()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_tab_close"):
		_close_tab(current_tab)
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_tab_previous"):
		_previous_tab()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_tab_next"):
		_next_tab()
		get_viewport().set_input_as_handled()


func _reload_tabs_names() -> void:
	var i: int = 0
	
	for c in get_children():
		if c is CodeEditor:
			set_tab_title(i, c.filename())
		
		i += 1


func _open_new_tab() -> void:
	add_child(CODE_EDITOR.instantiate())
	current_tab = get_tab_count() - 1


func _close_tab(tab: int) -> void:
	if tab >= 0:
		get_child(tab).queue_free()


func _next_tab() -> void:
	if current_tab < get_child_count():
		current_tab += 1


func _previous_tab() -> void:
	if current_tab > 0:
		current_tab -= 1
