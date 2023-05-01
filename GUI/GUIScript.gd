extends Node2D
var typeList = ['AND', 'Buffer', 'NAND', 'NOR', 'NOT', 'OR', 'XNOR', 'XOR']
var otherTypeList = ['IN', 'OUT', 'Delete']

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer.size_flags_vertical += Control.SIZE_EXPAND_FILL
	for gateType in typeList: #for each listed gateType
		var currentGateSelectionLabel = Label.new()
		currentGateSelectionLabel.text = gateType
		currentGateSelectionLabel.set_vertical_alignment(VERTICAL_ALIGNMENT_CENTER);
		currentGateSelectionLabel.set_horizontal_alignment(HORIZONTAL_ALIGNMENT_CENTER);
		currentGateSelectionLabel.add_theme_color_override("font_color", Color(0.0, 0.0, 0.0, 1.0))
		currentGateSelectionLabel.size_flags_vertical = Control.SIZE_EXPAND_FILL
		#currentGateSelectionLabel.size_flags_vertical = 
		# set color to black or something here
		get_node("HBoxContainer/Control/HBoxContainer/VBoxContainer2").add_child(currentGateSelectionLabel)
		var hlabelSeperator = HSeparator.new()
		get_node("HBoxContainer/Control/HBoxContainer/VBoxContainer2").add_child(hlabelSeperator)
		
		
		var currentGateTextureButton = TextureButton.new()
		currentGateTextureButton.texture_normal = load("res://Gate/" + gateType + ".png")
		currentGateTextureButton.texture_pressed = load("res://Gate/" + gateType + "Pressed.png")
		currentGateTextureButton.stretch_mode = TextureButton.STRETCH_KEEP_CENTERED
		currentGateTextureButton.name = gateType
		currentGateTextureButton.size_flags_vertical = Control.SIZE_EXPAND_FILL
		get_node("HBoxContainer/Control/HBoxContainer/VBoxContainer").add_child(currentGateTextureButton)
		
		
		var gateSeparator = HSeparator.new()
		get_node("HBoxContainer/Control/HBoxContainer/VBoxContainer").add_child(gateSeparator)
		
		
		#now manually add trigger
		currentGateTextureButton.connect("pressed",Callable(get_node("/root/Node2D"),"SetSelectedGate").bind(currentGateTextureButton))
		
	
	for otherType in otherTypeList:
		var currentOtherSelectionLabel = Label.new()
		currentOtherSelectionLabel.text = otherType
		currentOtherSelectionLabel.set_vertical_alignment(VERTICAL_ALIGNMENT_CENTER);
		currentOtherSelectionLabel.set_horizontal_alignment(HORIZONTAL_ALIGNMENT_CENTER);
		currentOtherSelectionLabel.add_theme_color_override("font_color", Color(0.0, 0.0, 0.0, 1.0))
		get_node("HBoxContainer//Control2/VBoxContainer").add_child(currentOtherSelectionLabel)
		
		var currentOtherTextureButton = TextureButton.new()
		currentOtherTextureButton.name = otherType
		currentOtherTextureButton.texture_normal = load("res://Input_Output/" + otherType + ".png")
		currentOtherTextureButton.stretch_mode = TextureButton.STRETCH_KEEP_CENTERED
		get_node("HBoxContainer//Control2/VBoxContainer").add_child(currentOtherTextureButton)
		
		#now manually add trigger
		currentOtherTextureButton.connect("pressed",Callable(get_node("/root/Node2D"),"SetSelectedGate").bind(currentOtherTextureButton))
		
	#set collision as same size as container
	await get_tree().process_frame
	$HBoxContainer/selectionCollision/CollisionShape2D.shape.size = $HBoxContainer/Control/HBoxContainer.get_rect().size
	$HBoxContainer/selectionCollision/CollisionShape2D.position = $HBoxContainer/Control/HBoxContainer.get_rect().get_center()
	
	$HBoxContainer/selectionCollision2/CollisionShape2D2.shape.size = $HBoxContainer/Control2/VBoxContainer.get_rect().size
	$HBoxContainer/selectionCollision2/CollisionShape2D2.position = ($HBoxContainer/Control2/VBoxContainer.get_screen_position() - Vector2(2,4))   + ($HBoxContainer/Control2/VBoxContainer.get_rect().size / 2 -  Vector2(1,1))
