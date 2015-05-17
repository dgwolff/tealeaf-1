# Procedural Blackjack

require "pry"

def say(msg)
  puts "=> #{msg}"
end

def calculate_total(cards)
  arr = cards.map { |e| e[0] }

  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select { |e| e == "Ace" }.count.times do
    total -= 10 if total > 21
  end

  total
end

# Start game
say "Welcome to Blackjack!"

cards = ["2", "3", "4", "5", "6", "7", "8", "9", "Jack", "Queen", "King", "Ace"]
suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

deck = cards.product(suits)
deck.shuffle!

# Deal cards
player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

player_total = calculate_total(player_cards)
dealer_total = calculate_total(dealer_cards)

# Show cards
say "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}"
say "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]} for a total of #{dealer_total}"
puts ""

# Player turn
if player_total == 21
  say "Blackjack! You win!"
  exit
end

while player_total < 21
  say "What would you like to do? 1) Hit 2) Stay"
  hit_or_stay = gets.chomp

  unless ["1", "2"].include?(hit_or_stay)
    say "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == "2"
    say "You chose to stay"
    break
  end

  new_card = deck.pop
  say "Dealing card to player: #{new_card}"
  player_cards << new_card
  player_total = calculate_total(player_cards)
  say "Your total is now: #{player_total}"

  if player_total == 21
    say "Blackjack! You win!"
    exit
  elsif player_total > 21
    say "You busted! Dealer wins!"
    exit
  end
end

# Dealer turn
if dealer_total == 21
  say "Dealer hit blackjack! Dealer wins!"
  exit
end

while dealer_total < 17
  new_card = deck.pop
  say "Dealing new card to dealer: #{new_card}"
  dealer_cards << new_card
  dealer_total = calculate_total(dealer_cards)
  say "Dealer total is now #{dealer_total}"

  if dealer_total == 21
    say "Dealer hit blackjack! Dealer wins!"
    exit
  elsif dealer_total > 21
    say "Dealer busted! You win!"
    exit
  end
end

# Compare hands
puts ""
say "Player's cards: "
player_cards.each do |card|
  say "#{card}"
end

puts ""
say "Dealer's cards: "
dealer_cards.each do |card|
  say "#{card}"
end
puts ""

if player_total > dealer_total
  puts "You won!"
elsif dealer_total > player_total
  puts "Dealer won!"
else
  puts "It's a tie!"
end
