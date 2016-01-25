module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
  puts  "I'm swimming!"
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Climbable
  include Walkable
end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end

john = Dog.new
john.swim
puts john.inspect
puts john.class.ancestors

sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

puts "#{sparky.class} #{sparky.swim}"
puts "#{neemo.class} #{neemo.swim}"
puts "#{paws.class} #{paws.swim}"