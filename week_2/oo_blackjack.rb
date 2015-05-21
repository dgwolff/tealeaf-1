# Object-Oriented Blackjack

# 1. Have detailed requirements or specifications in written form
# 2. Extract major nouns -> classes
# 3. Extract major verbs -> instance methods
# 4. Group instance methods into classes

class Card
  attr_accessor :suit, :face_value

  def initialize(s, fv)
    @suit = s
    @face_value = fv
  end

  def pretty_output
    "The #{face_value} of #{find_suit}"
  end

  def to_s
    pretty_output
  end

  def find_suit
    case suit
    when "H" then "Hearts"
    when "D" then "Diamonds"
    when "S" then "Spades"
    when "C" then "Clubs"
    end
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ["H", "D", "S", "C"].each do |suit|
      ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K",
       "A"].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s hand -----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end

  def total
    face_values = cards.map { |card| card.face_value }
    total = 0
    face_values.each do |val|
      if val == "A"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
    end

    face_values.select { |val| val == "A" }.count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

class Player
  include Hand
  attr_accessor :name, :cards

  def initialize(n)
    @name = n
    @cards = []
  end
end

class Dealer
  include Hand
  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end
end

deck = Deck.new

player = Player.new("Chris")
player.add_card(deck.deal_one)
player.add_card(deck.deal_one)
player.show_hand

dealer = Dealer.new
dealer.add_card(deck.deal_one)
dealer.add_card(deck.deal_one)
dealer.show_hand
