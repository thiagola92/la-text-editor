## Group [TabEditor]s in a way that you can visualize all of them.
##
## This is made using [SplitContainer]s to split [TabEditor]s and letting this scene manage them.
class_name GroupEditor
extends MarginContainer


const CODE_EDITOR := preload("res://src/components/code_editor/code_editor.tscn")

const TAB_EDITOR := preload("res://src/components/tab_editor/tab_editor.tscn")

@export var file_opener: FileDialog

## Holds temporarily a reference to the current [TabEditor].
var _current_tab_editor: TabEditor


func _ready() -> void:
	_add_split_container(_new_split_container()) # First SplitContainer.


func _shortcut_input(_event: InputEvent) -> void:
	if not _is_empty():
		return
	
	if Input.is_action_just_pressed("ui_file_open"):
		_on_tab_editor_open_file_requested(_new_tab_editor(true))
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_tab_new"):
		_add_split_container(_new_split_container())
		get_viewport().set_input_as_handled()


## Get if there is no [SplitContainer]s in the [GroupEditor].[br]
## This is necessary because some keybindings from [TabEditor] are still useful.[br]
## For example: open new tab and open file
func _is_empty() -> bool:
	for c in get_children():
		if c is SplitContainer:
			return false
	return true


## Add the [SplitContainer] to the [GroupEditor].[br][br]
## Used when adding the first [SplitContainer] because you need to grab the focus.[br]
## Otherwise the existing [TabEditor] would control the focus.
func _add_split_container(split_container: SplitContainer) -> SplitContainer:
	add_child(split_container)
	
	for c in split_container.get_children():
		if c is TabEditor:
			c.focus_current_tab()
			return split_container
	
	return split_container


## Create a [SplitContainer] with a [TabEditor] as child.
func _new_split_container(
	vertical: bool = false,
	tab_editor: TabEditor = _new_tab_editor()
) -> SplitContainer:
	var split_container := SplitContainer.new()
	
	split_container.vertical = vertical
	split_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split_container.size_flags_vertical = Control.SIZE_EXPAND_FILL
	
	split_container.add_child(tab_editor)
	split_container.child_order_changed.connect(
		_on_split_container_child_order_changed.bind(split_container)
	)
	
	return split_container


## Create a [TabEditor] and make this [GroupEditor] listen to requests from it.[br]
## Use [code]empty[/code] as true if you are going to manually create the tab later.
func _new_tab_editor(empty: bool = false) -> TabEditor:
	var tab_editor := TAB_EDITOR.instantiate() as TabEditor
	tab_editor.split_requested.connect(_on_tab_editor_split_requested)
	tab_editor.open_file_requested.connect(_on_tab_editor_open_file_requested)
	
	if not empty:
		tab_editor.new_tab()
	
	return tab_editor


func _on_split_container_child_order_changed(split_container: SplitContainer) -> void:
	if split_container.get_child_count() == 0:
		split_container.queue_free()


func _on_tab_editor_split_requested(tab_editor: TabEditor, vertical: bool) -> void:
	if not tab_editor.get_parent() is SplitContainer:
		return
	
	var parent := tab_editor.get_parent() as SplitContainer
	
	if parent.get_child_count() < 2:
		parent.add_child(_new_tab_editor())
		parent.vertical = vertical
	else:
		var index: int = tab_editor.get_index()
		var new_split_container := _new_split_container(vertical)
		tab_editor.reparent(new_split_container)
		parent.add_child(new_split_container)
		parent.move_child(new_split_container, index)


func _on_tab_editor_open_file_requested(tab_editor: TabEditor) -> void:
	_current_tab_editor = tab_editor
	file_opener.popup_centered()


## Open file in a new tab.
func _on_file_opener_file_selected(path: String) -> void:
	if not _current_tab_editor:
		return
	
	var code_editor: CodeEditor = _current_tab_editor.new_tab()
	var file_proxy: FileProxy = FilesProxies.get_file_proxy(path)
	
	code_editor.file_proxy = file_proxy
	
	# It's a temporary [TabEditor], we need to turn into permanent.
	if not _current_tab_editor.get_parent():
		_add_split_container(_new_split_container(false, _current_tab_editor))
	
	_current_tab_editor = null


## Cancel file opening.[br][br]
## This is important because a temporary [TabEditor] with [b]no parent[/b] is created
## before popup [member file_opener].[br][br]
## We have no way to know if the user will confirm or cancel this operation,
## so we hold creating [SplitContainer] and adding the [TabEditor] until the end.
func _on_file_opener_canceled() -> void:
	# It's a temporary [TabEditor], we need to free it.
	if not _current_tab_editor.get_parent():
		_current_tab_editor.queue_free()
	
	_current_tab_editor = null
