# good_dog.rb

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  attr_accessor :name, :height, :weight
  
  @@number_of_dogs = 0

  def self.total_number_of_dogs
    @@number_of_dogs
  end
  
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
    @@number_of_dogs += 1
  end
  
  def speak
   puts  "#{name} says Arf!"
  end
  
  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
  
  def info
    "#{self.name} weights #{self.weight} and is #{self.height} tall"
  end
  
  def to_s
    "This dog's name is #{name} and it is  in dog years."
  end
  
end


sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info
sparky.speak
puts sparky.name
sparky.name ="fido"
puts sparky.name
puts "-----------"
puts sparky
puts "-----------"
sparky.change_info('Spatricus', '24 inches', '15lbs')
puts sparky.info

dog1 = GoodDog.new('Luan', '16 inches', '45ib')
dog2 = GoodDog.new('Roger', '22 inches', '55lb')

puts "Total nymber of good dogs #{GoodDog.total_number_of_dogs}"

puts "==========="
puts "Sparky inspect #{sparky.inspect}"
puts "Sparky class #{sparky.class}"
puts "Sparky object_id #{sparky.object_id}"
puts "Sparky ancestors #{sparky.class.ancestors}"

