extends CanvasLayer
var beer_count = 0

func _ready():
	$beercount.text = "Beer Bottles:     " + str(beer_count)




func _on_beer_body_entered(body):
	if body.is_in_group("player"):
		beer_count = beer_count + 1
		$beercount.text = "Beer Bottles:     " + str(beer_count)
