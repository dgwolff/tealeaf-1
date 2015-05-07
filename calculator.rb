# Calculator

class String
  # Check whether user input is a number
  def number?
    /\A[-+]?\d+\z/ === self
  end
  # Check whether user input is a number from 1-4
  def valid_option?
    /[1-4]/ === self
  end
end

# Print defined text
def say(msg)
  puts "=> #{msg}"
end

# Print result
def say_result(result)
  puts "=> The result is #{result}"
end

# Begin program
loop do
  say 'Welcome to the simple calculator!'
  # Get num1 from user, permit only numeric input
  begin
    say "What's the first number?"
    num1 = gets.chomp
  end until num1.number?
  # Get num2 from user, permit only numeric input
  begin
    say "What's the second number?"
    num2 = gets.chomp
  end until num2.number?
  # Get selection from user, permit only numeric input from 1-4
  begin
    say 'Choose an operation:'
    say '1) add 2) subtract 3) multiply 4) divide'
    operator = gets.chomp
  end until operator.valid_option?

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
  # Run again?
  say 'Would you like to calculate again (Yes/No)?'
  calculate_again = gets.chomp.downcase
  break if calculate_again != 'y' && calculate_again != 'yes'
end
