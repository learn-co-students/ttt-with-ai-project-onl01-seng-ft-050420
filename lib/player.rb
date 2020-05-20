class Player
  
  attr_reader :token, :opponent
  
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
      
      if board.cells.count {|x| x == " "} == 9
        return "2"
      end
      
      new_board = nil
      moves = []
      scores = []
      
      i = 0
      while i < 9
        if board.cells[i] == " "
          new_board = Board.new
          new_board.cells = Marshal.load(Marshal.dump(board.cells))
          new_board.cells[i] = @token
          
          moves << i
          scores << minimax(new_board, @token)
          
        end  
        
        i += 1
      end
      
      move = moves[scores.index(scores.max)]
      return (move + 1).to_s
      
    end
    
    def minimax(board, token)
      
      if board.won?
        if board.winner == @token
          return 1
        else
          return -1
        end
      elsif board.full?
        return 0
      end
      
      if token == "X"
        opponent = "O"
      else 
        opponent = "X"
      end
      
      new_board = nil
      scores = []
      
      i = 0
      while i < 9
        if board.cells[i] == " "
          new_board = Board.new
          new_board.cells = Marshal.load(Marshal.dump(board.cells))
          new_board.cells[i] = opponent
          
          scores << minimax(new_board, opponent)
        end
      i += 1
      end
      
      if opponent == @token
        return scores.max
      else
        return scores.min
      end
      
    end
    
  end
  
end