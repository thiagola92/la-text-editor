class_name WindowEditor
extends Window


signal new_window_requested

signal quit_requested

@export var window_info: WindowInfo

@export var group_editor: GroupEditor

@export var project_opener: FileDialog


func _shortcut_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_window_new"):
		new_window_requested.emit()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_window_close"):
		queue_free()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_quit"):
		quit_requested.emit()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_project_open"):
		project_opener.popup_centered()
		get_viewport().set_input_as_handled()


func _close_project() -> void:
	pass


func _on_close_requested() -> void:
	queue_free()


# Open project in the current window (it will close current project).
func _on_project_opener_dir_selected(dir: String) -> void:
	_close_project()
