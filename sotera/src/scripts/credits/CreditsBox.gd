extends VBoxContainer

class_name CreditsBox

func set_data(color: Color,
		  name: String,
		 roles: String,
		  itch: String) -> void:
	var ln: Label = $Name
	ln.modulate = color
	ln.text = name
	
	var i: Label = $"Itch"
	i.modulate = color
	i.text = "Itch: " + itch
	
	var r: Label = $Roles
	r.modulate = color
	r.text = roles
