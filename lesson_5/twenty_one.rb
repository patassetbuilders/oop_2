

# This simplified version of the card game Twenty One.

# The cage consistes of two participants, the player and the def dealer
# The objective to the game is for the participants to get as close to twenty one without going over. 
# If they go over they bust or loose, if neither player goes over the player closest to 21 wins.

# How tthe game is played

# The dealer deals each player two cards from a 52 card def deck
# The dealer also deals themselves one card.

# The player then decides to either flip i.e. recieve and extra card ot sit.
# Once the player sits, the dealer plays
# The dealer can only sit if they are at least 17
  
# At the end of the round, the used cards are not returned to the deck.


# Score, Ace may be 1 or 11, picture cards are 10 all other cards are their face value. 
# At the end of each hand, the used cards are discarded, i.e not returned to the deck. 

#Nouns   - Player, Deck, Hand, Card, Game
#Verb    - Deal, flip, sit
#Attributes 

require 'pry'

class Player
  def initialize
    #name, #score #busted
  end
  
  def flip
  end
  
  def sit
  end

end

class Dealer
  def initiaize
    #score, #busted
  end
  
  def flip
  end
  
  def sit
  end
end

class Card

end

class Deck 
  SUIT = %w[D H S C]
  PICTURE = %w[J Q K A] 
  attr_accessor :cards
  # sets up deck 52 cards
  # keeps track of cards to go
  # could go array 52 elements sample with removal
  # deals a card
  def initialize
    @cards = []
    SUIT.each do |suit|
      (2..10).each do |number|
        number_card = number.to_s + suit
        @cards << number_card
      end
      PICTURE.each do |picture|
        picture_card = picture + suit
        @cards << picture_card 
      end
    end 
    @cards
  end
  
  def deal
    @cards.pop
  end
  
end



class Game
  
  def initialize

  end
  
  def play
    welcome_players
    
 #  deal cards
 #  human plays
 #  dealer plays
 #  display result
  end
  
  def welcome_players
    puts "Hi welcome to twenty one"
  end
  
end

game = Game.new
game.play
binding.pry