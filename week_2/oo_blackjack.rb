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
end

class Deck
end

class Player
end

class Dealer
end

class Hand
end

c1 = Card.new



