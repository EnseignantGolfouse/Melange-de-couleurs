extends Node


var red_percent: float = 0.5
var green_percent: float = 0.25
var blue_percent: float = 0.125
var black_percent: float = 0.125


func _ready():
	$Silo1.split_offset = - $Silo1.rect_size.y / 4
	$Silo1/Silo2.split_offset = - $Silo1/Silo2.rect_size.y / 6
	$Silo1/Silo2/Silo3.split_offset = 0
	self.recalculate()
	self.update_labels()

func _on_ChangeToMain_pressed():
	get_tree().change_scene("res://Main.tscn")


func recalculate():
	var total: float = $Silo1.rect_size.y
	var offset1: float = clamp(
		$Silo1.split_offset + $Silo1.rect_size.y / 2,
		0.0,
		$Silo1.rect_size.y)
	var offset2: float = clamp(
		offset1 + $Silo1/Silo2.split_offset + $Silo1/Silo2.rect_size.y / 2,
		offset1,
		$Silo1.rect_size.y)
	var offset3: float = clamp(
		offset2 + $Silo1/Silo2/Silo3.split_offset + $Silo1/Silo2/Silo3.rect_size.y / 2,
		offset2,
		$Silo1.rect_size.y)
	self.red_percent = offset1 / total
	self.green_percent = (offset2 - offset1) / total
	self.blue_percent = (offset3 - offset2) / total
	self.black_percent = 1.0 - (self.red_percent + self.green_percent + self.blue_percent)
	
	$ColorResult.color = Color(self.red_percent*3, self.green_percent*3, self.blue_percent*3, 1.0)

func update_labels():
	var red_percent_approx = int(self.red_percent * 100)
	var green_percent_approx = int(self.green_percent * 100)
	var blue_percent_approx = int(self.blue_percent * 100)
	var black_percent_approx = 100 - red_percent_approx - blue_percent_approx - green_percent_approx
	$RedQuantity.text = "Rouge : " + str(red_percent_approx) + "%"
	$GreenQuantity.text = "Vert : " + str(green_percent_approx) + "%"
	$BlueQuantity.text = "Bleu : " + str(blue_percent_approx) + "%"
	$BlackQuantity.text = "Noir : " + str(black_percent_approx) + "%"


func _on_Silo1_dragged(offset: int):
	self.recalculate()
	self.update_labels()

func _on_Silo2_dragged(offset: int):
	self.recalculate()
	self.update_labels()

func _on_Silo3_dragged(offset: int):
	self.recalculate()
	self.update_labels()
