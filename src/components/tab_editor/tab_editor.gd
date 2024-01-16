class_name TabEditor
extends TabContainer


const OPEN_NEW_TAB := preload("res://src/components/tab_editor/shortcuts/open_new_tab.tres") as Shortcut


func _ready():
	ButtonShortcut.new(OPEN_NEW_TAB, self, func(): add_child(CodeEditor.new()))
	
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	
	child_order_changed.connect(_update_tabs_names)
	
	add_theme_constant_override("side_margin", 0)
	add_child(CodeEditor.new())


func _update_tabs_names():
	var i: int = 0
	
	for c in get_children():
		if c is CodeEditor:
			set_tab_title(i, c.filename())
		i += 1
