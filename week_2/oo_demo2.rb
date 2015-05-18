class Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def eat
    "#{name} is eating"
  end

  def speak
    "#{name} is speaking"
  end
end

class Mammal < Animal
  def warm_blooded?
    true
  end
end

module Swimmable
  def swim
    "#{name} is swimming!"
  end
end

module Fetchable
  def fetch
    "#{name} is fetching!"
  end
end

class Dog < Mammal
  include Swimmable
  include Fetchable

  def fetch
    "#{name} is fetching!"
  end

  def speak
    "#{name} is barking!"
  end
end

class Cat < Mammal
  def speak
    "#{name} is meowing!"
  end
end

teddy = Dog.new('teddy')
# puts teddy.name
# puts teddy.eat
# puts teddy.fetch
# puts teddy.speak
# puts teddy.warm_blooded?
puts teddy.swim
puts teddy.fetch

kitty = Cat.new('kitty')
# puts kitty.name
# puts kitty.eat
# puts kitty.speak
