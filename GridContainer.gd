extends VBoxContainer

func _on_Button_pressed():
	var black: float = float($ColorSelection/InputBlack.text)
	var red: float = float($ColorSelection/InputRed.text)
	var green: float = float($ColorSelection/InputGreen.text)
	var blue: float = float($ColorSelection/InputBlue.text)
	var total: float = black + red + green + blue
	if total != 0.0:
		red *= 3/total
		green *= 3/total
		blue *= 3/total
		print("red = ", red, ", green = ", green, ", blue = ", blue)
		
		$ColorContainer/Color.color = Color(red, green, blue, 1.0)
