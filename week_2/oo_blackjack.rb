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
    puts "The #{face_value} of #{find_suit}"
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
      ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].each do |face_value|
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

class Player
end

class Dealer
end

class Hand
end

deck = Deck.new


