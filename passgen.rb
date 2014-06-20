require 'SecureRandom'

puts "\n >>> Password generator <<< \n"
print " >>> Display some advices or informations ? (y/n) "

if gets.chomp == 'y'
  puts " > This script uses the SecureRandom.urlsafe_base64 method, low but efficient"
  puts " > a..z ; A..Z ; 0..9 ; - ; _ : used by default to ensure safety"
  puts " > More characters enhances the security at the cost of the readability"
  puts " > You may accept to use the other symbols if you want more security"
end

print "\n >>> How many characters? "
passwordLength, symbolsUse = gets.to_i, 0

print " >>> Use symbols? (y/n) "

if gets.chomp == 'y'
  symbols = "&~#([|^@])}{$€#*µ%!,;:.?<>/+"
  print " >>> How many? "
  symbolsUse = gets.to_i
end

puts "\n >>> Generating your password, it might take a while..."
password = SecureRandom.urlsafe_base64(passwordLength-symbolsUse)[1..(passwordLength-symbolsUse)]
symbolsUse.times { password += symbols[rand(0..symbols.length-1)] }
if symbolsUse > 0 then password = password.split(//).shuffle.join end

puts " >>> Your new password is : #{password}"
print " >>> Check the hackability of this ? (y/n) "

if gets.chomp == 'y'

  hackability = symbolsUse > 0 ? (92 * password.length) ** 2 : (64 * password.length) ** 2
  puts " > #{hackability} possibilities."

  case hackability
  when 0..3e5
    puts " > Less a second/minute to crack it! Be careful!"
  when 3e5..4e5
    puts " > Easily breakable, some hours then you'll die."
  when 4e5..1e6
    puts " > Your password should be fine, but still breakable (few weeks..a year)."
  when 1e6..3e6
    puts " > Strong as a rock! It takes many years to bruteforce it."
  when 3e6..8e7
    puts " > Unbreakable! Even the NSA can't break your password until thousands of years!"
  else
    puts " > Haha! Will you be able to remember it?"
  end

end