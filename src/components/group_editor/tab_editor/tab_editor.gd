class_name TabEditor
extends TabContainer


func _ready():
	get_tab_bar().tab_close_display_policy = TabBar.CLOSE_BUTTON_SHOW_ALWAYS
	get_tab_bar().tab_close_pressed.connect(_on_tab_close_pressed)
	
	child_order_changed.connect(_update_tabs_names)
	
	_update_tabs_names()


func _shortcut_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_window_new"):
		# TODO: Create new process of the game with parameters to open in this directory.
		pass
	elif Input.is_action_just_pressed("ui_tab_new"):
		add_child(CodeEditor.new())
		current_tab = get_tab_count() - 1
		get_viewport().set_input_as_handled()


func _update_tabs_names():
	var i: int = 0
	
	for c in get_children():
		if c is CodeEditor:
			set_tab_title(i, c.filename())
		i += 1


func _on_tab_close_pressed(tab: int):
	get_child(tab).queue_free()
