puts "\n >>> A Rock-Paper-Scissors game <<< \n"

def element (number)
  case number
  when 1 then number = :rock
  when 2 then number = :paper
  when 3 then number = :scissors
  else puts " >>> INVALID CHOICE"
  end
  return number
end

score, playerChoice = 0, 0
rules = { :rock => :paper, :paper => :scissors, :scissors => :rock }
print " >>> How many rounds : "

gets.to_i.times do

  loop do
    print "\n >>> 1.Rock 2.Paper 3.Scissors : "
    playerChoice = element(gets.to_i)
    break if playerChoice.class == Symbol
  end

  aiChoice = element(rand(1..3))
  puts " > You played with the #{playerChoice}."
  puts " > The AI played with the #{aiChoice}."
  
  case ([playerChoice, aiChoice] & rules.values_at(playerChoice, aiChoice)).first
  when playerChoice
    puts " >>> You won !"
    score += 1
  when aiChoice
    puts " >>> You lost !"
    score -= 1
  else puts " >>> There's no winner."
  end

end

2.times { puts }
puts score > 0 ? "Well played !" : "There's no tricks !"
at_exit { puts "Your score is : #{score} !" }