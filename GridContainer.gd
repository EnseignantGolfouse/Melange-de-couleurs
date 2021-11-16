extends VBoxContainer

func _on_Button_pressed():
	var black: float = $ColorSelection/InputBlack.value
	var red: float = $ColorSelection/InputRed.value
	var green: float = $ColorSelection/InputGreen.value
	var blue: float = $ColorSelection/InputBlue.value
	var total: float = black + red + green + blue
	if total != 0.0:
		red *= 3/total
		green *= 3/total
		blue *= 3/total
		$ColorContainer/Color.color = Color(red, green, blue, 1.0)
