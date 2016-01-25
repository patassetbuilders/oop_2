require 'pry'
require 'time'

module Truckable
  def blast_air_horn(time)
    air_horn = 'Ba'
    time.times do
     air_horn += 'a'
    end
    air_horn += 'h!'
  end
end

class Vehicle
  @@number_of_vehicles = 0
  
  def self.number_of_vehicles
    @@number_of_vehicles
  end
  
  def initialize()
    @@number_of_vehicles += 1
  end
  
  def self.mileage(liters, km) #class method
    puts "#{liters / (km / 100) } liters / 100 km"
  end
  
  def spray_paint(new_color)
    self.color = new_color
  end
  
  def start_engine
    puts "Starting engine..."
    rand(5).times do
      puts ('TrrrRrrr')
      sleep(1)
    end
    self.engine = 'Running'
    puts "Engine #{self.engine}"
  end
  
  def stop_engine
    puts "Turning off engine..."
    sleep(2)
    @engine = 'off'
    puts "Engine #{@engine}"
  end

  def speed_up(n=1)
    @current_speed += n
    puts "Speed up #{n} - speed is now #{@current_speed} km/hr" 
    sleep(0.5)
  end

  def break(n=1)
    if @current_speed > n
      @current_speed -= n
    else
      @current_speed = 0
    end
       
    puts "Break #{n} - speed is now #{@current_speed} km/hr" 
    sleep(0.5)
  end
  
end


class Truck < Vehicle
  include Truckable
  NUMBER_OF_DOORS = 2
end

class MyCar < Vehicle
  
  attr_accessor :color, :current_speed, :engine
  attr_reader :year, :model

  NUMBER_OF_DOORS = 4
  
  def initialize(year,  model, color)
    super()
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @engine = 'off'
  end
  
  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
  
  def show_year
   puts "year is #{self.year}"
  end
  
  def stop
    @current_speed = 0
    puts "Stopping Car  - speed is now #{@current_speed} km/hr" 
  end
  
  def age
    "Your #{self.model} is #{how_old} years old"
  end

  private
  
  def how_old
    Time.now.year - self.year
  end

end


first_car = MyCar.new(1963, 'holden', 'green')
puts first_car

first_car.start_engine

5.times {first_car.speed_up}
first_car.speed_up(20)
10.times {first_car.break}
first_car.stop

first_car.stop_engine
first_car.year
first_car.color = 'blue'
puts first_car.color
puts first_car.spray_paint('red')

puts first_car.show_year

puts first_car.age

MyCar.mileage(7, 100) #class method

puts first_car.inspect

big_truck = Truck.new()
puts "Big truck says #{big_truck.blast_air_horn(6)}"

puts big_truck.inspect

puts "Total number of vehicles is #{Vehicle.number_of_vehicles}"

puts "Exersize 4 - method look up"
puts MyCar.class.ancestors

puts "======== Exersize 7 ============="

class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end

  protected

  def grade
    @grade
  end

end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)

system 'clear'
puts system 'ls'

# class Person
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end
# 
# bob = Person.new("Steve")
# puts bob.inspect
# bob.name = "Bob"
# puts bob.inspect