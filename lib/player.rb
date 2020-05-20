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
     
      max_moves = []
      
      i = 0
      while i < moves.count
        max_moves << moves[i] if scores[i] == scores.max
      i += 1
      end
      
      move = max_moves.shuffle[0]
      
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
        next_player = "O"
      else 
        next_player = "X"
      end
      
      new_board = nil
      scores = []
      
      i = 0
      while i < 9
        if board.cells[i] == " "
          new_board = Board.new
          new_board.cells = Marshal.load(Marshal.dump(board.cells))
          new_board.cells[i] = next_player
          
          scores << minimax(new_board, next_player)
        end
      i += 1
      end   
      
      if next_player == @token
        return scores.max
      else
        return scores.min
      end
      
    end
    
  end
  
end