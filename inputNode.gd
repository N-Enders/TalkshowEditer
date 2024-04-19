extends GraphNode

@export var editableText: PackedScene

signal move_connection

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func createBranch(value):
	var branches = get_child_count() - 2
	var newText = editableText.instantiate()
	newText.setText(str(value))
	add_child(newText)
	move_child(newText,branches)
	set_slot(branches + 1,false,0,Color.WHITE,true,0,Color.RED)
	newText.deleted.connect(_deleted_option.bind(newText))

func _on_add_normal_branch_pressed():
	createBranch("")

func getData():
	var index = 0
	var returnValue = {}
	var children = get_children()
	while index < len(children) - 1:
		index += 1
		if children[index] is TextEdit:
			returnValue[index] = children[index].getText()
		elif children[index] is Container:
			returnValue[index] = "NoMatch"
	return returnValue


func _deleted_option(option):
	remove_child(option)
	set_slot(get_child_count()-1,false,0,Color.WHITE,false,0,Color.RED)