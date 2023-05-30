# cours

x_thor, y_thor = 5, 5
x_eclair, y_eclair = 10,10

while x_thor != x_eclair || y_thor != y_eclair
	direction_x = ""
	direction_y = ""

	if x_thor < x_eclair
		x_thor += 1
		direction_x = "E" # Est
	elsif x_thor > x_eclair
		x_thor -= 1
		direction_x = "W" # Ouest
	end

	if y_thor < y_eclair
		y_thor += 1
		direction_y = "S" # Sud
	elsif y_thor > y_eclair
		direction_y = "N" # Nord
	end

	puts direction_y + direction_x
end

  

