puts ">>> Nickname generator <<<"

vowels, conson = "aaaeeeeeiiiooouuy", "bbbcccdddffgghhjjklllmmnnppqrrrssstttvvwxz"
nick = String.new

puts "ADVICE : choose between 3 and 12 letters will bring better results"
print "How many ? "

(gets.chomp.to_i / 2).times do
  nick += vowels[rand(0..vowels.length)]
	nick += conson[rand(0..conson.length)]
end

at_exit { puts "\nYour new nickname is #{nick.capitalize} !"}
