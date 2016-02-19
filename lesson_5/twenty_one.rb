# tewenty one
class Participant
  attr_accessor :name, :hand, :score

  def initialize
    @score = 0
    @hand = []
  end

  def sum_hand
    hand_total = 0
    aces = []
    @hand.each do |card|
      if card.to_i != 0
        hand_total += card.to_i # number card
      elsif card.start_with?('A') # ace
        hand_total += 11
        aces << card
      else
        hand_total += 10 # picture card
      end
    end
    aces.each do
      hand_total -= 10 if hand_total > 21
    end
    hand_total
  end

  def busted?
    sum_hand > 21
  end
end

class Player < Participant
  def sit_or_flip?
    valid_choice = %w(F S)
    loop do
      puts "What is your next move ? Flip or Sit (Enter F or S)" # deal another card or change players
      choice = gets.chomp.upcase
      return choice if valid_choice.include?(choice)
      puts "That is not a valid choice"
    end
  end
end

class Dealer < Participant
end

class Deck
  SUIT = %w(D H S C)
  PICTURE = %w(J Q K A)
  attr_accessor :cards

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
    @cards = @cards.shuffle
  end

  def deal(player)
    player.hand << @cards.pop
  end

  def cards_left
    @cards.size
  end
end

class Game
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    welcome_players
    loop do # hand loop
      initial_deal
      loop do
        break if @player.sum_hand >= 21 || @player.sit_or_flip? == 'S' 
        # could have had
        # breaf if @player.busted? || @player.sum_hand = 21 || @player.sit? (different method required)
        # Appreciate your comments on which you feel is the best way to go and why?
        @deck.deal(@player)
        display_hands
      end
      loop do
        break if @dealer.sum_hand >= 17
        @deck.deal(@dealer)
        display_hands
        sleep(2)
      end
      display_hands
      determine_winner
      display_winner
      update_score
      display_score
      sleep(3)
      break if @deck.cards_left < 10
    end
    system 'clear'
    puts "Game over - Final score"
    display_score
  end

  def welcome_players
    system 'clear'
    puts "Hi"
    puts "Welcome to Twenty One"
  end

  def initial_deal
    system 'clear' if @deck.cards_left < 50
    puts "Dealing Cards"
    sleep(2)
    @player.hand = []
    @dealer.hand = []
    2.times { @deck.deal(@player) }
    @deck.deal(@dealer)
    display_hands
  end

  def display_hands
    system 'clear' if @deck.cards_left < 49
    puts ""
    puts "Your Hand    #{@player.hand.join(', ')} = #{@player.sum_hand} #{'Player Busted' if @player.busted?}"
    puts "Dealers Hand #{@dealer.hand.join(', ')} = #{@dealer.sum_hand} #{'Dealer Flips' if @dealer.hand.size > 1 && @dealer.sum_hand < 17} #{'Dealer Busted' if @dealer.busted?} #{'Dealer sits' if !@dealer.busted? && @dealer.sum_hand >= 17}  "
    puts ""
  end

  def determine_winner # not correct
    if @player.busted?
      return @dealer
    elsif @dealer.busted? && !@player.busted?
      return @player
    elsif @dealer.sum_hand > @player.sum_hand
      return @dealer
    elsif @player.sum_hand == @dealer.sum_hand
      return nil
    else
      return @player
    end
  end

  def update_score
    if determine_winner == @dealer
      @dealer.score += 1
    elsif determine_winner == @player
      @player.score += 1
    end
  end

  def display_winner
    if determine_winner == @dealer
      puts "Dealer WON!!"
    elsif determine_winner == @player
      puts "You WON!!"
    else
      puts "Tied Hand"
    end
    # should I call display score from here or from play game
  end

  def display_score
    puts "Score You #{@player.score} Dealer #{@dealer.score}"
  end
end

game = Game.new
game.play
