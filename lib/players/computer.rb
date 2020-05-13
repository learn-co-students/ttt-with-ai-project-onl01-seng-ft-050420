require 'pry'

module Players
  class Computer < Player

    # def move(board = Board.new)
    #   "1"
    # end
    def opponent_player
      self.token == "X" ? Players::Computer.new("O") : Players::Computer.new("X")
    end

    def move(game)
      return (minimax(game, self)[:i] + 1).to_s
    end 

    def minimax(game, player)
      available_indices = game.board.cells.each_index.select {|i| game.board.cells[i] == " "}

      if game.draw?
        return {score: 0}
      elsif game.winner == player.token
        return {score: 10}
      elsif game.winner == player.opponent_player.token
        return {score: -10}
      else 
        moves = []
        available_indices.each do |index|
          move = Hash.new
          move[:i] = index
          move[:index_value] = game.board.cells[index]
          game.board.cells[index] = player.token

          if (player == self)
            result = minimax(game, self.opponent_player)
            move[:score] = result[:score]
          else 
            result = minimax(game, self)
            move[:score] = result[:score]
          end

          game.board.cells[index] = move[:index_value]
          moves << move
        end 

        if player == self
          best_score = -100000
          next_move = moves.detect { |move| move[:score] > best_score }
          if next_move
            best_score = next_move[:score]
            best_move = next_move[:i]
          end 
        else
          best_score = 100000
          next_move = moves.detect { |move| move[:score] < best_score }
          if next_move
            best_score = next_move[:score]
            best_move = next_move[:i]
          end
        end 
        
        return next_move

      end
    end 
  end 
end 


    # def move(game)
    # end 

    # def minimax (game, player_1, player_2)
    #   if game.over?
    #     if game.draw?
    #       return 0
    #     else
    #       return (game.winner == self.token ? 1 : -1)
    #     end
    #   end
      
    #   new_move = -1
    #   score = -2

    #   available_indices = game.board.cells.each_index.select {|i| game.board.cells[i] == " "}
    #   available_indices.each do |index|
    #     game_with_new_move = game
    #     input = (index + 1).to_s
    #     game_with_new_move.board.update(input, self)
    #     score_for_the_move = -self.opponent_player.move(game_with_new_move)
    #     if score_for_the_move > score
    #       score = score_for_the_move
    #     end
    #     new_move = index
    #   end 
    #   if new_move == -1
    #     return 0
    #   end 
    #   return score
    # end 

    # def move(game = Game.new)
    #   best_score = -3.0/0.0
    #   available_indices = game.board.cells.each_index.select {|i| game.board.cells[i] == " "}
    #   available_indices.each do |index|
    #     input = (index + 1).to_s
    #     game.board.update(input, self)
    #     score = minimax(game, 0, false)
    #     game.board.cells[index] = " "
    #     best_score = [best_score, score].max
    #     return input 
    #   end 
    # end

    # def minimax(game, depth, is_maximizing)
    #   if game.over?
    #     if game.draw?
    #       return 0
    #     else
    #       return (game.winner == self.token ? 1 : -1)
    #     end
    #   elsif is_maximizing == true
    #     best_score = -3.0/0.0
    #     available_indices = game.board.cells.each_index.select {|i| game.board.cells[i] == " "}
    #     available_indices.each do |index|
    #       input = (index + 1).to_s
    #       game.board.update(input, self)
    #       score = minimax(game, depth + 1, false)
    #       game.board.cells[index] = " "
    #       best_score = [score, best_score].max
    #     end 
    #     return best_score
    #   else 
    #     best_score = 3.0/0.0
    #     available_indices = game.board.cells.each_index.select {|i| game.board.cells[i] == " "}
    #     available_indices.each do |index|
    #       input = (index + 1).to_s
    #       game.board.update(input, self.opponent_player)
    #       score = minimax(game, depth + 1, true)
    #       game.board.cells[index] = " "
    #       best_score = [score, best_score].min
    #     end
    #     return best_score 
    #   end
    # end 

#   end 
# end 