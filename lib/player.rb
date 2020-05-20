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

      new_board = nil # board to store a hypothetical move
      moves = [] # array to store possible moves (empty spots)
      scores = [] # array to store the minimax score of each moves[]
      
      i = 0
      while i < 9 #loop through all board spots
      
        if board.cells[i] == " " # if the spot is empty
        
          # make a new board and try that move
          # you cannot do new_board = board because new_board will be a pointer to the actual game board
          
          new_board = Board.new # make a new board object
          new_board.cells = Marshal.load(Marshal.dump(board.cells)) # copy the contents from the current board
          new_board.cells[i] = @token # make the move on the empty spot
          
          moves << i # add the spot to the array of possible moves
          scores << minimax(new_board, @token) # get the minimax score of that move
        end  
        
        i += 1
      end
      
      # Now we need to return move that has the highest minimax score
      # If multiple moves have the same minimax score, then pick a random one
      # This is to test the robustness of the algorithm so it doesn't end up playing the same game every time
      
      max_moves = []
      
      i = 0
      while i < moves.count
        max_moves << moves[i] if scores[i] == scores.max
      i += 1
      end
      
      move = max_moves.shuffle[0] #Randomize!!!!
      
      # Return the move
      return (move + 1).to_s
      
    end
    
    def minimax(board, token)
      # minimax() takes two variables
      # board is a board representing the next hypothetical move
      # token is the player which made the hypothetical move
      
      # A minimax score is returned ONLY if the game is over
      # If the current player @token won, the minimax is 1
      # If the opponent won, the minimax is -1
      # If the game is tied, the minimax is 0
      # You will need to write won?() and winner() methods for the Board class
      # The test only requires them for the Game class
      # But since we're making a bunch of hypothetical boards, we need to be able to check whether those boards result in wins
      
      if board.won?
        if board.winner == @token
          return 1
        else
          return -1
        end
      elsif board.full?
        return 0
      end
      
      # If the game isn't over yet, we do not return a minimax score
      # Instead, we check all possible subsequent moves until the game is over
      # This can be done by recursively calling minimax() until an endpoint is reached
      
      # With recursive call of minimax(), switch the player
      
      if token == "X"
        next_player = "O"
      else 
        next_player = "X"
      end
      
      # Same drill as in the move() method
      # Loop through the empty spots to get possible moves
      # Get minimax scores for each possible moves
      # Only difference is, no moves[] array here, since we're not making an actual move
      
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
      
      # We need to decide whether to maximize or minimze
      # If the current player @token is making the hypothetical move, we pick the max
      # If the current player's opponent is making the hypothetical move, we pick the min
      # You can do it this way, or you can use a depth counter 
      # Maximize when depth is odd, minimize when depth is even, etc
      
      if next_player == @token
        return scores.max
      else
        return scores.min
      end
      
    end
    
  end
  
end