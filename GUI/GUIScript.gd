extends MarginContainer
var typeList = ['AND', 'Buffer', 'NAND', 'NOR', 'NOT', 'OR', 'XNOR', 'XOR']

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	for gateType in typeList: #for each listed gateType
		var currentGateSelectionLabel = Label.new()
		currentGateSelectionLabel.text = gateType
		currentGateSelectionLabel.set_vertical_alignment(VERTICAL_ALIGNMENT_CENTER);
		currentGateSelectionLabel.set_horizontal_alignment(HORIZONTAL_ALIGNMENT_CENTER);
		currentGateSelectionLabel.add_theme_color_override("font_color", Color(0.0, 0.0, 0.0, 1.0))
		# set color to black or something here
		$VBoxContainer.add_child(currentGateSelectionLabel)
		
		var currentGateTextureButton = TextureButton.new()
		currentGateTextureButton.texture_normal = load("res://Gate/" + gateType + ".png")
		currentGateTextureButton.stretch_mode = TextureButton.STRETCH_KEEP_CENTERED
		$VBoxContainer.add_child(currentGateTextureButton)
		
		#now manually add trigger
		currentGateTextureButton.connect("pressed",Callable(get_node("/root/Node2D"),"SetSelectedGate").bind(gateType))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass







#func _on_ANDButton_pressed():
	#get_node("/root/Node2D").SelectedGate("AND")
