# Blackjack

# Player is dealt two cards to start game
# Dealer is dealt two cards to start game
# Player chooses to hit or stay
#   If total of cards = 21, player wins
#   If total of cards > 21, player busts
#   if total of cards < 21, player can hit again or stay
#   If player hits, repeat above
#   If player stays, player's total is saved and turn moves to the dealer
# Dealer must continue to hit until total is >= 17
#   If dealer total > 21, player wins
#   If dealer total = 21, dealer wins
#   If dealer total = 17-20, higher total hand wins

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

say "Welcome to Blackjack!"

cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
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
say "What would you like to do? 1) Hit 2) Stay"
hit_or_stay = gets.chomp

case hit_or_stay
when "1"
  player_cards << deck.pop
  p player_cards
when "2"
  say "You chose to stay"
end












