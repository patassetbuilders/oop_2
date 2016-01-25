require 'pry'

# question 1
# ben is correct because he has included attr_reader

class BankAccount
  attr_accessor :balance

  def initialize(starting_balance)
    self.balance = starting_balance # or @balance but not balance
  end

  def positive_balance?
    self.balance >= 0 # or simply balance 
  end
end

acc_1 = BankAccount.new(100000)
puts acc_1.inspect
puts acc_1.positive_balance?

#question 2

class InvoiceEntry
  attr_accessor :product_name,  :quantity 

  def initialize(product_name, number_purchased)
    @product_name = product_name
    @quantity = number_purchased
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
   @quantity = updated_count if updated_count >= 0
  end
end

inv_entry_1 = InvoiceEntry.new('bottle',10)
puts inv_entry_1.inspect

inv_entry_1.update_quantity(20)
puts inv_entry_1.inspect

inv_entry_1.update_quantity(-10)
puts inv_entry_1.inspect

#binding.pry

puts inv_entry_1.quantity = -30

# using the attr_accessor works however it means
# quantity can be updated directly bupassing the safeguards
# built into the update_quantity method


# Question 4
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end
end

new_greeting = Hello.new
new_greeting.hi

second_greeting = Goodbye.new
second_greeting.bye

# question 5
# the to_s string works because puts calls to_s
class KrispyKreme
  attr_reader :filling_type, :glazing
  
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end
  
  def to_s
    filling_string = filling_type ? filling_type : "Plain"
    glazing_string = glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end
  
end
 
donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")


 
puts donut1
puts donut2
puts donut3
puts donut4
puts donut5


# Question 7 
# change light_information to information
# class method is then called with Lighting.information 