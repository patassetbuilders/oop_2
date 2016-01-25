require 'pry'

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
puts bruno.inspect

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

johny = BadDog.new(2, "bear")
puts johny.inspect 