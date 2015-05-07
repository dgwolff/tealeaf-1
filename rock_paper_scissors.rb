# Rock, Paper, Scissors

CHOICES = { 'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors' }

puts 'Play Rock, Paper, Scissors!'

def display_winning_message(winning_choice)
  case winning_choice
  when 'r'
    puts 'Rock smashes Scissors'
  when 'p'
    puts 'Paper wraps Rock'
  when 's'
    puts 'Scissors cuts Paper'
  end
end

loop do
  # player chooses move
  begin
    puts 'Pick one: (r, p, s):'
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  # computer chooses move
  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "It's a tie!"
  # player wins
  elsif (player_choice == 'p' && computer_choice == 'r') ||
        (player_choice == 's' && computer_choice == 'p') ||
        (player_choice == 'r' && computer_choice == 's')
    display_winning_message(player_choice)
    puts 'You won!'
  else
    display_winning_message(computer_choice)
    puts 'Computer won!'
  end

  puts 'Play again? (y/n)'
  break if gets.chomp.downcase != 'y'
end

puts 'Good bye!'
