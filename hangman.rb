puts " >>> A hangman game ! You know the rules... <<<"
score = 0
secretWord = String.new

loop do

  loop do

    print " >>> 1 or 2 players ? "

    case gets.chomp.to_i
    when 1
      secretWord = File.readlines("dico.txt").sample
      secretWord.delete!("\n").upcase!
      break
    when 2
      print "Enter some word : "
      secretWord = gets.chomp.upcase
      break
    else
      puts "I don't understand !"
    end

  end

  cache = secretWord.gsub(/./, '_')
  30.times { puts }

    loop do

      puts cache
      print "Guess a letter, type \"found\" or \"stop\" : "
      guess = gets.chomp.upcase

      if guess.length == 1

        if secretWord.include?(guess)
          p = secretWord.index(guess)
          cache[p] = secretWord[p]

          until secretWord.index(guess, p+1) == nil do
            p = secretWord.index(guess, p+1)
            cache[p] = secretWord[p]
          end
        end

      elsif guess == "FOUND"
        print "So wut ? "
        if gets.chomp.upcase == secretWord
          cache = secretWord
          print "YEAH ! "
          score += 10
        else
          puts "Nope !"
        end
      
      elsif guess == "STOP"
        print "Are you sure ? (y/n) "
        if gets.chomp == 'y'
          cache = secretWord
          print "Never give up dude ! "
          score -= 30
        end

      else
        puts "What did you mean ???"

      end

      if cache == secretWord
        puts "The word was \"#{secretWord}\" !"
        score += 20
        2.times { puts }
        break
      else
        score -= 1
        puts
      end

    end

  print "Try again ? (y/n) "
  break if gets.chomp == 'n'

end

at_exit { puts "Your score is : #{score}" }