extends Container

signal deleted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setText(text):
	$TextEdit.text = text


func getText():
	return $TextEdit.text


func _on_button_pressed():
	deleted.emit()
