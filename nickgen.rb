puts "\n >>> Nickname generator <<<"

vowels, conson, nick = "aaaeeeeeiiiooouuy", "bbbcccdddffgghhjjklllmmnnppqrrrssstttvvwxz", String.new
puts "ADVICE : choose between 3 and 12 letters will bring better results"
print "How many ? "
i = gets.to_i

until nick.length == i
	nick += vowels[rand(vowels.length-1)]
	nick += conson[rand(conson.length-1)]
end

at_exit { puts "\nYour new nickname is #{nick.capitalize} !" }