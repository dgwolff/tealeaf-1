# Simple calculator

def say(msg)
  puts "=> #{msg}"
end

def say_result(result)
  puts "=> The result is #{result}"
end

loop do
  say "Welcome to the simple calculator!"
  say "What's the first number?"
  num1 = gets.chomp # modify to only allow numeric input

  say "What's the second number?"
  num2 = gets.chomp # as above

  say "Choose an operation:"
  say '1) add 2) subtract 3) multiply 4) divide'
  operator = gets.chomp

  if operator == '1'
    result = num1.to_i + num2.to_i
    say_result(result)
  elsif operator == '2'
    result = num1.to_i - num2.to_i
    say_result(result)
  elsif operator == '3'
    result = num1.to_i * num2.to_i
    say_result(result)
  else
    if num2 == '0'
      say 'Error! Cannot divide by 0!'
    else
      result = num1.to_f / num2.to_f
      say_result(result)
    end
  end

  say 'Would you like to calculate again (Yes/No)?'
  calculate_again = gets.chomp.downcase
  break if calculate_again != 'y' && calculate_again != 'yes'
end
