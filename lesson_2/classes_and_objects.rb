require 'pry'

#Exersize 1
# class Person
#   attr_accessor :name
#   
#   def initialize(n)
#     @name = n
#   end
# end
# 
# bob = Person.new('bob')
# #bob.name = 'bob'
# puts bob.inspect

class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end
  
  def name
    "#{self.first_name} #{self.last_name}".strip
  end
  
  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

end
bob = Person.new('Robert Johnson')
puts bob.name                  
puts bob.first_name            
puts bob.last_name             
puts bob.last_name = 'Smith'
puts bob.name
p bob                  

bobex4 = Person.new('Robert Smith')
robex4 = Person.new('Robert Smith')

puts bobex4.name.include?robex4.name

puts "Comparing strings #{bobex4.name == robex4.name}" 

puts "The persons name is #{bob}" #returns the obgect
