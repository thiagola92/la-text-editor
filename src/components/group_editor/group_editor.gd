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
	add_child(_new_split_container()) # First SplitContainer.


## Get if there is no [SplitContainer]s in the [GroupEditor].[br]
## This is necessary because some keybindings from [TabEditor] are still useful.[br]
## For example: open new tab and open file
func _is_empty() -> bool:
	for c in get_children():
		if c is SplitContainer:
			return false
	return true


## Create a [SplitContainer] with a [TabEditor] child.[br]
## [GroupEditor] will listen signals of [TabEditor]s created this way.
func _new_split_container(vertical: bool = false) -> SplitContainer:
	var tab_editor: TabEditor = _new_tab_editor()
	var split_container := SplitContainer.new()
	
	split_container.vertical = vertical
	split_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split_container.size_flags_vertical = Control.SIZE_EXPAND_FILL
	split_container.add_child(tab_editor)
	split_container.child_order_changed.connect(
		func():
			if split_container.get_child_count() == 0:
				split_container.queue_free()
	)
	
	return split_container


## Create a [TabEditor] and make this [GroupEditor] listen to requests from it.
func _new_tab_editor() -> TabEditor:
	var tab_editor := TAB_EDITOR.instantiate() as TabEditor
	tab_editor.split_requested.connect(_on_tab_editor_split_requested)
	tab_editor.open_file_requested.connect(_on_tab_editor_open_file_requested)
	tab_editor.new_tab()
	
	return tab_editor


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
	_current_tab_editor = null


func _on_child_order_changed() -> void:
	# Never leave GroupEditor empty, otherwise TabEditor keybindings will not work
	# And you will have to implement some of them in GroupEditor.
	if _is_empty():
		add_child(_new_split_container())
