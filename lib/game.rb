require_relative "board.rb"
require_relative "player.rb"

class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [  [0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [2,4,6] ]
                        
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count.odd? ? player_2 : player_1
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
    end
    
    return false if @board.full?
  end
  
  def draw?
    return @board.full? && !won?
  end
  
  def over?
    return won? || draw?
  end
  
  def winner
    if won? != nil
      return @board.cells[won?[0]]
    else
      return nil
    end
  end
  
  def turn
    input = current_player.move(@board)
    
    while !@board.valid_move?(input)
      input = current_player.move(@board)
    end
    
    @board.update(input, current_player)
    puts
    @board.display
  end
  
  def play
    while !over?
      turn
    end
    
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
  
end

player_1 = Players::Computer.new("X")
player_2 = Players::Computer.new("O")

board = Board.new
board.cells = [" "," "," "," "," "," "," "," "," "]

game = Game.new(player_1, player_2, board)
board.display
game.play












