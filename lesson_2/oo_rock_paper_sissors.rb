# Rock Paper Sissors is a two player game where
# each player chooses one of three possible moves,
# tries to selects paper, scissor or rocks
# the chosen moves are then compared according to the following rules

# - rock beats scissor
# - scissor beats paper
# - paper beats rock
# If both players have the same selection the game is tied

# Nouns: player, move, rules
# Verbs: choose, compare

# Refactoring
# Design feels cleaner, less complicatde if then else statements
# Primary improvement - if else structure removed



# ==================== RPS Bonus Feature ==================
# Keeping score 
# to me this is an attribute of the player class

# Add Lizard and Spock

# Add rock paper and scissor class 
# They could tell who they beat and who beats them. 

# Keep track of a history of moves 
# perhaps 2 arrays - one for player and 
# one for compuree let you count the occurances or alternatively ywo hashses.

# adjust based on history requires three your move, computer move who won
# if ratios vary much fro the one third, then their is a bias that should be exployted. 

# computer personalities, generate a random number say 1 - 10
# then based on the outcome  of the random number assign a move
# eg if number between 1-8 choose rock or
# if number is 9-10 choose paper
# never chose sissors


 

require 'pry'


class Move
  
  attr_accessor :value
  VALUES = ['rock', 'paper', 'scissors']
  
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end
  
  def rock?
    @value == 'rock'
  end
  
  def paper?
    @value == 'paper'
  end
    
  def >(other_move)
    (rock? && other_move.scissors?) ||  
    (paper? && other_move.rock?) || 
    (scissors? && other_move.paper?) 
    # OR operator is a boolean returnd true or false
  end
  
  def <(other_move)
    (rock? && other_move.paper?) ||
    (paper? && other_move.scissors?) ||
    (scissors? && other_move.rock?) 
  end
end


class Player
  
  attr_accessor :move, :name
  
  def initialize
    set_name
  end

end

class Human < Player
  def set_name
    n = ''
    loop do 
      puts "Please enter your name"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry I did not get your name"
    end
    self.name = n
  end
  
  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Number 5', 'Wallee'].sample
  end
 
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end


class RPSGame
 
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def display_welcome_message
    puts "Hi #{human.name}, Welcome to paper sissor rock"
    puts "You are playing #{computer.name}"
  end
  
  def display_goodbye_message
    puts "Thank you for playing Paper Sissor Rock"
  end
  
  def display_moves
    puts "You choose #{human.move.value}"
    puts "#{computer.name} choose #{computer.move.value}"
  end
  
  def display_winner
    if human.move > computer.move
      puts "You won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "Its a tie"
    end
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? Enter Y / N"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "That is not a valid response"
    end
    return false if answer == 'n'
    return true if answer == 'y' 
  end 
  
  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again? 
    end 
    display_goodbye_message
  end
end  


RPSGame.new.play



