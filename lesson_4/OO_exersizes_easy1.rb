require 'pry'

# Question one 
# they are all objects
# calling the class method on the object

puts true.class
puts "hello".class
puts [1, 2, 3, "happy days"].class
puts 142.class


module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

car_1 = Car.new
car_1.go_fast

puts car_1.methods.include?(:go_fast)  # => true



# Question 3, is because we called self.class inside the interpolation in the go_fast method. note interpolation altomatically calls the to_s method.

# Question 4
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

bad_cat = AngryCat.new
puts "Bad Cat says #{bad_cat.hiss} "


puts "exersize 5"
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

fruit_1 = Fruit.new('pear')
pizza_1 = Pizza.new('hawian')

puts fruit_1.inspect
puts pizza_1.inspect

puts pizza_1.instance_variables
# the pizza_1 has the @name instance variable

class Cube
  def initialize(volume)
    @volume = volume
  end
  
  def get_volume
    @volume
  end
end

# question 6
cube_1 = Cube.new(1)
puts cube_1.get_volume

# question 7
puts cube_1.to_s
# prints the object class and id (encoded)
# to be sure check the class definition for a local .to_s method

class Cat
  attr_accessor :type, :age
  @@cats_count = 0
  
  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
    puts self.inspect
  end
    
  def make_one_year_older
    self.age += 1
    puts self.inspect
  end
end

pussy_1 = Cat.new('tabby')

puts pussy_1.make_one_year_older

# question 8
# self refers to the object that is calling the method,
# in this example self refers to pussy_1


# question 9
# the self refers to the cats class

# question 10

class Bag
  attr_accessor :color, :material
  
  def initialize(color, material)
    @color = color
    @material = material
  end
end 

bag_1 = Bag.new('blue', 'plastic')

puts bag_1.inspect
puts bag_1.color


