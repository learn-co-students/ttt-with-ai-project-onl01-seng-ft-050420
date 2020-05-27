class Player
  
  attr_reader :token
  
  def initialize(token)
    @token = token
  end
  
end

class Players
  class Human < Player
    
    def move(board)
      puts "Player #{@token}: Make a move:"
      input = gets
    end
    
  end
  
  class Computer < Player
    
    def move(board)

      moves = minimax(board, @token, true)    
      max_moves = []

      moves.each do |key, value|
        max_moves << key if value == moves.values.max
      end
      
      move = max_moves.shuffle[0]
      
      return (move + 1).to_s

    end
    
    def minimax(board, token, first_call)

      if board.won?
        if board.winner == @token
          return 1
        else
          return -1
        end
      elsif board.full?
        return 0
      end

      if first_call
        next_player = token
      elsif token == "X"
        next_player = "O"
      else 
        next_player = "X"
      end

      new_board = nil
      moves = {}

      i = 0
      while i < 9
        if board.cells[i] == " "
          new_board = Board.new
          new_board.cells = Marshal.load(Marshal.dump(board.cells))
          new_board.cells[i] = next_player
          
          moves[i] = minimax(new_board, next_player, false) 
        end
      i += 1
      end   
      
      if first_call 
        return moves
      end

      if next_player == @token
        return moves.values.max
      else
        return moves.values.min
      end
    
    end
    
  end

end