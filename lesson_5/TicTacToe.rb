# Description
# Tic Tac Toe is a game played between two players, namely X and O
# the game is playes on a three by three grid
# each player takes turns at placing their mark in an empty square in the grid
# the game is won by the first player to place three marks in a straight line, either, vertically, horizontally or diagonally

# Noun player, game, board, square, mark
# Verb play_game, mark_grid

require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagnoals
  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end
  
  def joinor 
    if unmarked_keys.size > 1
      unmarked_keys[0..(unmarked_keys.size - 2)].join(', ') + ' or ' + unmarked_keys.last.to_s
    else
      unmarked_keys.last.to_s
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker # returns winning marker or nil
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end
  
  def at_risk_square  # does not read as well as has_advantage_square IMH
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if squares.select(&:human_marker?).collect(&:marker).size == 2
        squares.each do |square| 
          return @squares.key(square) if square.unmarked?
        end
      end
    end
    nil
  end
  
  
  def has_advantage_square
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if computer_has_two_squares?(squares)
        squares.each do |square| 
          if square.unmarked?  # reads better than above
            return @squares.key(square)
          end
        end
      end
    end
    nil
  end
  

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def computer_has_two_squares?(squares) # not used incorporated into at_risk_square
     markers = squares.select(&:computer_marker?).collect(&:marker)
     if markers.size == 2
       return true
     else
       return false
     end
  end

  
  def human_has_two_squares?(squares)
     markers = squares.select(&:human_marker?).collect(&:marker)
     if markers.size == 2
       return true
     else
       return false
     end
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end
  
  def human_marker?
    marker == TTTGame::HUMAN_MARKER
  end

  def computer_marker?
    marker == TTTGame::COMPUTER_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end


class Player
  attr_reader :marker
  attr_accessor :number_of_wins, :name

  def initialize(marker)
    @marker = marker
    @number_of_wins = 0
  end
  
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  GAMES_PER_MATCH = 5
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_welcome_message
   # player.set_up_players
    loop do # play again 
      loop do # first to five
        display_board
        loop do # players take turns
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board
        end
        update_score
        display_result
        game_reset
        break if match_over? 
      end
      display_play_again_message
      break unless play_again?
      reset_score
    end
    display_goodbye_message
  end

  private

  def clear
    system "clear"
  end

  def current_player_moves
    if @current_marker == HUMAN_MARKER
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_welcome_message
    clear
    puts "Welcome to Tic Tac Toe - Winner is first to 5"
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ''
  end

  def human_moves
    puts "Your move!"
    puts "Choose one of the following squares (#{@board.joinor})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that is not a valid choice"
    end
    board.[]=(square, human.marker)
  end

  def computer_moves
    if board.has_advantage_square
      board.[]=(board.has_advantage_square, computer.marker)
    elsif board.at_risk_square
      board.[]=(board.at_risk_square, computer.marker)
    else
      board.[]=(board.unmarked_keys.sample, computer.marker)
    end
  end
  
  def update_score
    case board.winning_marker
      when human.marker
        human.number_of_wins += 1
      when computer.marker
        computer.number_of_wins += 1
      end
  end
  
  def reset_score
    human.number_of_wins = 0
    computer.number_of_wins = 0
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won"
    else
      puts "Its a tie"
    end
    puts "Current Score  - YOU #{human.number_of_wins}  Computer #{computer.number_of_wins}" 
    puts "Winner is first to 5"
    sleep 3
  end

  def game_reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Lets play again!"
    puts ''
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (Y/N)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end
  
  def match_over?
    human.number_of_wins == GAMES_PER_MATCH || computer.number_of_wins == GAMES_PER_MATCH
  end

  def display_goodbye_message
    case human.number_of_wins 
      when GAMES_PER_MATCH
        puts "You win #{human.number_of_wins} games to #{computer.number_of_wins}"
      else
        puts "Computer wins #{computer.number_of_wins} games to #{human.number_of_wins}"
      end 
    puts "Thank you for playing Tic Tac Toe - Goodbye for now"
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
