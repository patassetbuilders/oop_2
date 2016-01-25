require 'pry'

class Pet
  def jump
    'jumping!'
  end
  
  def run
    'running!'
  end

end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
  
end

class Bulldog < Dog
  def swim
    'cannot swim'
  end
end

class Cat < Pet
  def speak
    'Meao'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim

ralph = Bulldog.new
puts ralph.speak           # => "bark!"
puts ralph.swim

binding.pry