puts "\n >>> A Rock-Paper-Scissors game <<< \n"
score, playerChoice = 0, 0
print " >>> How many rounds : "

gets.to_i.times do

  loop do
    print "\n >>> 1.Rock 2.Paper 3.Scissors : "
    playerChoice = gets.chomp.to_i
    print " > You played with the "
    case playerChoice
    when 1
      puts "rock."
      break
    when 2
      puts "paper."
      break
    when 3
      puts "scissors."
      break
    else
      puts "INVALID CHOICE"
    end
  end

  print " > The AI played with the "
  case aiChoice = rand(1..3)
  when 1
    puts "rock."
  when 2
    puts "paper."
  when 3
    puts "scissors."
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
