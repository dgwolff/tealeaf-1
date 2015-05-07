# Calculator

class String
  def valid_number?
    /\A[-+]?\d+\z/ === self
  end

  def valid_operator?
    /[1-4]/ === self
  end
end

def print_result(result)
  puts "=> The result is #{result}"
end

loop do
  puts 'Welcome to the simple calculator!'

  begin
    puts "What's the first number?"
    num1 = gets.chomp
  end until num1.valid_number?

  begin
    puts "What's the second number?"
    num2 = gets.chomp
  end until num2.valid_number?

  begin
    puts 'Choose an operation:'
    puts '1) add 2) subtract 3) multiply 4) divide'
    operator = gets.chomp
  end until operator.valid_operator?

  if operator == '1'
    result = num1.to_i + num2.to_i
    print_result(result)
  elsif operator == '2'
    result = num1.to_i - num2.to_i
    print_result(result)
  elsif operator == '3'
    result = num1.to_i * num2.to_i
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
  break if calculate_again != 'y' && calculate_again != 'yes'
end
