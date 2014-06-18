puts "\n >>> You have to find a secret word, each player has 5 tries ! <<<"
score = 0
secretWord = String.new

loop do

  loop do

    print " >>> 1 or 2 players ? "

    case gets.to_i
    when 1
      secretWord = File.readlines("dico.txt").sample
      secretWord.delete!("\n")
      break
    when 2
      print "Enter some word : "
      secretWord = gets.chomp
      break
    else
      puts "I don't understand !"
    end

  end

  shakedWord = secretWord.split(//).shuffle.join
  30.times { puts }

  (1..5).each do |i|
    puts "--- #{6-i} tries/try left."
    print "What's this word : #{shakedWord} ? "
    if gets.chomp == secretWord
      puts "Well played !\n"
      score += 5
      break
    else
      puts "Try again...\n"
      score -= 1
    end
  end

  print "The game is over. Play a new one ? (y/n) "
  break if gets.chomp == 'n'
  
end

at_exit { puts "Your score is : #{score} !" }