# Calculator

VALID_NUMBER_INPUT = /^-?\d*(\.\d+)?$/
VALID_OPERATOR_SELECTION = /^[1-4]$/

def print_result(result)
  puts "=> The result is #{result}"
end

loop do
  puts 'Welcome to the simple calculator!'

  begin
    puts "What's the first number?"
    num1 = gets.chomp
  end until num1.match(VALID_NUMBER_INPUT)

  begin
    puts "What's the second number?"
    num2 = gets.chomp
  end until num2.match(VALID_NUMBER_INPUT)

  begin
    puts 'Choose an operation:'
    puts '1) add 2) subtract 3) multiply 4) divide'
    operator = gets.chomp
  end until operator.match(VALID_OPERATOR_SELECTION)

  if operator == '1'
    result = num1.to_f + num2.to_f
    print_result(result)
  elsif operator == '2'
    result = num1.to_f - num2.to_f
    print_result(result)
  elsif operator == '3'
    result = num1.to_f * num2.to_f
    print_result(result)
  else
    if num2 == '0'
      puts 'Error! Cannot divide by 0!'
    else
      result = num1.to_f / num2.to_f
      print_result(result)
    end
  end

  puts 'Would you like to calculate again (Yes/No)?'
  calculate_again = gets.chomp.downcase
  break unless %w(y yes).include? calculate_again
end
