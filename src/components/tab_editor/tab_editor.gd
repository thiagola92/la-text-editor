## Container for tabs where each tab holds a [CodeEditor].
##
## With this you can have multiple files opened and transit between which you want to see.[br][br]
class_name TabEditor
extends TabContainer


## Signal [GroupEditor] to split group.
signal split_requested(tab_editor: TabEditor, vertical: bool)

## Signal [GroupEditor] to let the user select a drive file to be opened in [TabEditor].
signal open_file_requested(tab_editor: TabEditor)

const CODE_EDITOR := preload("res://src/components/code_editor/code_editor.tscn")


func _ready():
	# Some behaviors can't be setted through TabContainer, so we need to obtain TabBar from it.
	get_tab_bar().tab_close_display_policy = TabBar.CLOSE_BUTTON_SHOW_ALWAYS
	get_tab_bar().tab_close_pressed.connect(_close_tab)
	
	_reload_tabs_names()


func _shortcut_input(_event: InputEvent) -> void:
	if not get_child(current_tab).has_focus() and not get_tab_bar().has_focus():
		return
	
	if Input.is_action_just_pressed("ui_group_half_v"):
		split_requested.emit(self, true)
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_group_half_h"):
		split_requested.emit(self, false)
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_file_open"):
		open_file_requested.emit(self)
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_tab_new"):
		new_tab()
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


## Creates a [CodeEditor] and insert in a new tab.[br]
## Return the [CodeEditor] created in case needs to setup [member CodeEditor.file_proxy].
func new_tab() -> CodeEditor:
	var code_editor := CODE_EDITOR.instantiate() as CodeEditor
	
	add_child(code_editor)
	current_tab = get_tab_count() - 1
	
	return code_editor


func _reload_tabs_names() -> void:
	var i: int = 0
	
	for c in get_children():
		if c is CodeEditor:
			set_tab_title(i, c.filename())
		
		i += 1


func _close_tab(tab: int) -> void:
	if tab >= 0:
		get_child(tab).queue_free()


func _next_tab() -> void:
	if current_tab < get_child_count():
		current_tab += 1


func _previous_tab() -> void:
	if current_tab > 0:
		current_tab -= 1


func _on_child_order_changed() -> void:
	if get_child_count() == 0:
		queue_free()
	else:
		_reload_tabs_names()
	
