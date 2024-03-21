class_name ArgsUtility
extends Node


## Get a [code]Dictionary[/code] with all arguments and yours respective values.[br][br]
## Arguments start with [code]--[/code] and anything else is a value.[br]
## Values are appended to the last argument found.[br]
## Which means that this both arguments generate the same dictionary:
## [codeblock]
## --file a.py b.py --dir ./project/
## --file a.py --dir ./project/ --file b.py
## [/codeblock]
## [codeblock]
## {
##     "--file": ["a.py", "b.py"],
##     "--dir": ["./project/"]
## }
## [/codeblock]
static func get_args() -> Dictionary:
	var user_args = OS.get_cmdline_user_args()
	var args: Dictionary = {}
	var arg: String
	
	for value: String in user_args:
		if arg.begins_with("--"):
			if not arg in args:
				args[value] = []
			arg = value
		else:
			if arg in args and args[arg] is Array:
				args[arg].append(value)
	
	return args
