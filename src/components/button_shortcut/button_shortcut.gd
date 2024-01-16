class_name ButtonShortcut
extends BaseButton


func _init(shortcut_res: Shortcut, focus: Node, on_pressed: Callable):
	shortcut = shortcut_res
	shortcut_context = focus
	pressed.connect(on_pressed)
	focus.get_tree().root.add_child.call_deferred(self)
