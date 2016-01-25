require 'pry'

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
  
  def [](idx)
      members[idx]
    end

    def []=(idx, obj)
      members[idx] = obj
    end
end

# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys.members << Person.new("Troy Aikman", 48)
cowboys.members << Person.new("Emmitt Smith", 46)
cowboys.members << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners.members << Person.new("Joe Montana", 59)
niners.members << Person.new("Jerry Rice", 52)
niners.members << Person.new("Deion Sanders", 47)


dream_team = cowboys + niners
puts dream_team
puts dream_team.inspect

binding.pry

   
