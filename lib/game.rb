
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.taken?(combo[0]) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
    end
  end

  def draw? 
    @board.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end 

  def winner
    if combo = self.won?
      @board.cells[combo[0]]
    end
  end

  def turn
    puts "Please enter a number (1-9):"
    input = gets.strip
    while !@board.valid_move?(input)
      self.turn
    end
    self.current_player == player_1 ? player_2 : player_1
  end 
end