require 'pry'

class SecretFile

  def initialize(secret_data, logger) # logger is a logging object
    @data = secret_data
    # need to initialise an instance of the security logger
    @logger = logger
    puts "Iam inside initialize"
  end
  
  
  def data
    @logger.create_log_entry
   
    @data
  end
  
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
    puts "i am the security logger"
  end
end

my_secret = SecretFile.new('my secret file goes here', 'eg users name')
 
 
# Question 2

module Moveable
  attr_accessor :speed, :heading 
  attr_accessor :range, :fuel_capacity, :fuel_efficiency
  
  def range
    puts "i am in range"
      @fuel_capacity * @fuel_efficiency
    end
end


class WheeledVehicle
  include Moveable
  #attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with
    super([20,20], 80, 8.0)
  end
end


class Seacraft
  include Moveable
  
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    @fuel_capacity = liters_of_fuel_capacity
    @fuel_efficiency = km_traveled_per_liter
    @range = self.range + 10# ... code omitted ...
  end
  
  
end

class Catamaran < Seacraft
  include Moveable
  attr_accessor :propeller_count, :hull_count #note :range is a method not an instance variable

end

class Motorboat < Seacraft
  def initialize ( km_traveled_per_liter, liters_of_fuel_capacity )
    super(1,1, km_traveled_per_liter, liters_of_fuel_capacity )
  end
end
  

my_boat = Catamaran.new(4,2,23,1000)



binding.pry