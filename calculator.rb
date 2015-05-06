# Simple calculator

require 'pry'

def say(msg)
  puts "=> #{msg}"
end

loop do
  say "What's the first number?"
  num1 = gets.chomp

  say "What's the second number?"
  num2 = gets.chomp

  say '1) add 2) subtract 3) multiply 4) divide'
  operator = gets.chomp

  if operator == '1'
    result = num1.to_i + num2.to_i
    say "Result is #{result}"
  elsif operator == '2'
    result = num1.to_i - num2.to_i
    say "Result is #{result}"
  elsif operator == '3'
    result = num1.to_i * num2.to_i
    say "Result is #{result}"
  else
    if num2 == '0'
      say 'Error! Cannot divide by 0!'
    else
      result = num1.to_f / num2.to_f
      say "Result is #{result}"
    end
  end

  say 'Would you like to calculate again (Yes/No)?'
  calculate_again = gets.chomp.downcase
  break if calculate_again == 'n' || calculate_again == 'no'
end
