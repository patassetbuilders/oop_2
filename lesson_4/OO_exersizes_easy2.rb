require 'pry'

class Oracle
  def predict_the_future
    "You will " + choice.sample
  end

  def choice
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
puts oracle.predict_the_future
puts oracle.predict_the_future
puts oracle.predict_the_future
puts oracle.predict_the_future
puts oracle.predict_the_future
puts oracle.predict_the_future
puts oracle.predict_the_future
puts oracle.predict_the_future
puts oracle.predict_the_future

# "it will return the string 'You will' +
# one of the phrases from the choices array


class RoadTrip < Oracle
  def choice
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
puts trip.predict_the_future


# Question 2
# method look up for choices starts with the class of object that 
# is making the call, and 
# stops looking once it finds the method with that name
# so even though predict_the_future method is in the super class
# ruby will first search for choice.sample in the calling RoadTrip class

# Question 3 
# you call ancestors method on the class
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts HotSauce.ancestors
puts Orange.ancestors

# Question 4
class BeesWax
  attr_accessor :type # replaces getter and settor methods
  def initialize(type)
    @type = type
  end

  #def type
  #  @type
  # end

  #def type=(t)
  #  @type = t
  # end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

wax_1 = BeesWax.new('old')
puts wax_1.type

# Question 5
# excited_dog = "excited dog"- local variable
# @excited_dog = "excited dog" - instance variable @
# @@excited_dog = "excited dog" - class variable @@


# Question 6
class Television
  def self.manufacturer
    # method logic
    puts "Hi from class method"
  end

  def model
    # method logic
  end
end

# self.manufacturer is a class method as denoted by the self.

my_tv = Television.new

puts Television.manufacturer


# question 7
class Cat
  @@cats_count = 0
    

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    puts self
    @@cats_count
  end
end

pussy = Cat.new('tabby')

# puts pussy.cats_count => returns no method error
puts Cat.cats_count

# The @@cat_count variable is a class variable 
# in this case its job is to keep track of the number of
# instances of the cat class that have been created
# the cats_count method can be called dierectly on the Cat class but
# not on the cat object

# question 8
# make Bingo class a sub class of Games
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

quick_money = Bingo.new
puts quick_money.play # => Start the game!

# question 9 
# would depend if which class the of the  instance object calling the play
# method. If it was a game object the play method would be called
# if it was a bingo instance then the bingo play method woyuld be called
# see method look up

# Question 10 
# main benefits of object oriented programming
# encapulation - don't need to understand the implementation
# objects states can only be accessed by instance methods
# polymorphism - reuse code
# ability to chunk problems into into smaller managible pieces.
# model real world problems
