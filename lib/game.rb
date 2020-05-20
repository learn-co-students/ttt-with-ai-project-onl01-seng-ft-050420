class Game
  
  attr_accessor :player_1, :player_2, :board, :winner

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    
    ]

  def current_player #game.current_player.token = "X"
    board.turn_count.even? ? player_1 : player_2
  end

  # def won?
  #   WIN_COMBINATIONS.find do |combo|
  #       if board.taken?(combo[0]) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
  #       return combo
  #       end
  #     end
  # end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    draw? || won?
  end

  def winner
    if won? 
      board.cells[won?[0]]
    else
      nil 
    end
  end
  # def winner
  #   if winning_combo = won?
  #     @winner = board.cells[winning_combo.first]
  #   end
  # end
  def turn #makes valid moves, asks for input again after failed validation changes to player 2 
      player = self.current_player 
      move = player.move(board)
      if board.valid_move?(move)
        board.update(move, player)
        board.display
      else
        turn
      end
  end
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
  end
  
  def self.start
  puts "Welcome to Tic Tac Toe!"
  puts "What kind of game would you like to play? (0, 1, or 2 players)"
  input = gets.strip
    if input == "0"
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
    elsif input == "1"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
    elsif input == "2"
      Game.new
    end
  end


end