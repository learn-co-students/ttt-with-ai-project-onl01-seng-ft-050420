class Board
  attr_accessor :board
  
  def reset
    @board = Array.new(9, " ")
  end
  
  def initialize
    reset
  end
  
  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(input)
    board[input.to_i - 1]
  end
  
  def full?
    @board.all?{ |token| token == "X" || token == "O"} 
  end
  
  def turn_count
    @board.count{ |token| token == "X" || token == "O" }
  end 
  
  def position_taken?(input)
    input_to_index(input) == "X" || input_to_index(input) == "O"
  end 
  
  def valid_move?(input)
    position_taken?(input) == false && input.between?(0, 8)
  end
  
  def update(input, player)
    @board[input_to_index(input)] = player.token
  end
  
end