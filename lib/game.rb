class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  board = Board.new
  player_1 = Players::Human.new("X")
  player_2 = Players::Human.new("O")
  
  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == "X" && 
          @board[combo[1]] == "X" &&
          @board[combo[2]] == "X") ||
          (@board[combo[0]] == "O" &&
          @board[combo[1]] == "O" &&
          @board[combo[2]] == "O")
          return combo
      end
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    @board.full? || won? || draw?
  end
  
  def winner
    won? ? @board.board[won?[0]] : nil
  end

  def turn 
    player = current_player
    current_move = player.move(board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.display
      turn
      puts "Invalid Move"
      turn
    end
  end 

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw? 
      puts "Cat's Game!"
    end
  end
end