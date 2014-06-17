puts " >>> A Rock-Paper-Scissors game <<< \n"
score, playerChoice = 0, 0
print " >>> How many rounds : "

gets.chomp.to_i.times do

  puts

  loop do
    print " >>> 1.Rock 2.Paper 3.Scissors : "
    playerChoice = gets.chomp.to_i
    print " > You played with the "
    case playerChoice
    when 1
      print "rock.\n"
      break
    when 2
      print "paper.\n"
      break
    when 3
      print "scissors.\n"
      break
    else
      puts " >>> Invalid choice."
    end
  end

  print " > The AI played with the "
  case aiChoice = rand(1..3)
  when 1
    print "rock.\n"
  when 2
    print "paper.\n"
  when 3
    puts "scissors.\n"
  end
  
  if playerChoice == 1 && aiChoice == 3 || playerChoice == 2 && aiChoice == 1 || playerChoice == 3 && aiChoice == 2
    puts " >>> You won !"
    score += 1
  elsif playerChoice == aiChoice
    puts " >>> There's no winner."
  else
    puts " >>> You lost !"
    score -= 1
  end

end

2.times { puts }
puts score > 0 ? "Well played !" : "There's no tricks !"
at_exit { puts "Your score is : #{score} !" }