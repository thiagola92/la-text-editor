class_name TabEditor
extends TabContainer


const CODE_EDITOR := preload("res://src/components/group_editor/tab_editor/code_editor/code_editor.tscn")


func _ready():
	get_tab_bar().tab_close_display_policy = TabBar.CLOSE_BUTTON_SHOW_ALWAYS
	get_tab_bar().tab_close_pressed.connect(_close_tab)
	
	child_order_changed.connect(_update_tabs_names)
	
	_update_tabs_names()


func _shortcut_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_window_new"):
		# TODO: Create new process of the game with parameters to open in this directory.
		pass
	elif Input.is_action_just_pressed("ui_tab_new"):
		_open_new_tab()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_tab_close"):
		_close_tab(current_tab)
		get_viewport().set_input_as_handled()


func _update_tabs_names():
	var i: int = 0
	
	for c in get_children():
		if c is CodeEditor:
			set_tab_title(i, c.filename())
		i += 1


func _open_new_tab():
	add_child(CODE_EDITOR.instantiate())
	current_tab = get_tab_count() - 1


func _close_tab(tab: int):
	get_child(tab).queue_free()
