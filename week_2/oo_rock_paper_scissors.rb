# Object-Oriented Rock, Paper, Scissors

class Hand
  include Comparable

  attr_reader :value

  def initialize(v)
    @value = v
  end

  def <=>(other)
    if @value == other.value
      0
    elsif (@value == 'r' && other.value == 's') ||
          (@value == 'p' && other.value == 'r') ||
          (@value == 's' && other.value == 'p')
      1
    else
      -1
    end
  end

  def display_winning_message
    case @value
    when 'r'
      puts 'Rock smashes Scissors'
    when 'p'
      puts 'Paper wraps Rock'
    when 's'
      puts 'Scissors cuts Paper'
    end
  end
end

class Player
  attr_accessor :hand
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def to_s
    "#{name} chose #{hand.value}!"
  end
end

class Human < Player
  def pick_hand
    begin
      puts 'Pick one: (r, p, s):'
      c = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)

    self.hand = Hand.new(c)
  end
end

class Computer < Player
  def pick_hand
    self.hand = Hand.new(Game::CHOICES.keys.sample)
  end
end

class Game
  CHOICES = { 'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors' }

  attr_reader :player, :computer

  def initialize
    @player = Human.new("Bob")
    @computer = Computer.new("R2D2")
  end

  def compare_hands
    if player.hand == computer.hand
      puts "It's a tie!"
    elsif player.hand > computer.hand
      player.hand.display_winning_message
      puts "#{player.name} won!"
    else
      computer.hand.display_winning_message
      puts "#{computer.name} won!"
    end
  end

  def play
    player.pick_hand
    computer.pick_hand
    puts player
    puts computer
    compare_hands
  end
end

Game.new.play
