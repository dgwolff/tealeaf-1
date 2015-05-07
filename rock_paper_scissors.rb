# Rock, Paper, Scissors

CHOICES = { 'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors' }

puts 'Play Rock, Paper, Scissors!'

loop do
  # player chooses move
  begin
    puts 'Pick one: (p, r, s ):'
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  # computer chooses move
  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "It's a tie!"
  # player wins
  elsif (player_choice == 'p' && computer_choice == 'r') ||
        (player_choice == 'r' && computer_choice == 's') ||
        (player_choice == 's' && computer_choice == 'p')
    puts 'You won!'
  else
    puts 'Computer won!'
  end
end
