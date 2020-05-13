class Player
  
  attr_reader :token
  
  def initialize(token)
    @token = token
  end
  
end

class Players
  class Human < Player
    
    def move(board)
      puts "Player #{token}: Make a move:"
      input = gets
    end
  end
  
  class Computer < Player
    def move(board)
      
      if (board.cells.count {|x| x == " "}) == 9
        input = rand(1..9).to_s
      else
        input = (minimax(board, token) + 1).to_s
      end
      
      return input
    end
    
    def minimax(board, token)
      if board.won?
        if board.winner == token
          return 1
        else
          return -1
        end
      end
    
      new_board = Board.new
      
      i = 0
      
      while i < 9
        new_board.cells[i] = board.cells[i]
        i += 1
      end

      if token == "X"
        opponent = "O"
      elsif token == "O"
        opponent = "X"
      end

      move = -1
      score = -2
      
      i = 0
      
      while i < 9
        if board.cells[i] == " "
          new_board.cells[i] = token
          move_score = self.minimax(new_board, opponent)
          if move_score > score
            score = move_score
            move = i
          end
          
        end
        i += 1
      end
      
      return 0 if move == -1
      return move
    end
    
  end
end