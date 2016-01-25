# good_dog_class.rb

class Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end
  
  end
  
  def speak(message)
    puts "#{self.name} says #{message}"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new("Bella")
puts sparky.speak('Woof')  
puts paws.speak("Meooow") 
puts sparky.inspect      
puts paws.inspect
puts sparky.class.ancestors