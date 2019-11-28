extends Node2D

var hit = false

func _ready():
	$AmbientSound.play()
	
func _process(delta):
	if $UFO.hit == false and hit == true:
		print("GAME OVER!")
		$UFO.gameOver = true
		$UFO.score = 0
		$GameOverLabel.visible = !$GameOverLabel.visible
	elif ($UFO.hit == true or hit == true) and $GameOverLabel.visible:
		$GameOverLabel.visible = !$GameOverLabel.visible
	$UFO.hit = false
	hit = false


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		hit = true
	$ScoreLabel.text = "Score: " + str($UFO.score)
	if $UFO.score == 0:
		$ScoreLabel.set("custom_colors/font_color", Color(1, 0, 0, 1))
	else:
		$ScoreLabel.set("custom_colors/font_color", Color(1, 1, 1, 1))
