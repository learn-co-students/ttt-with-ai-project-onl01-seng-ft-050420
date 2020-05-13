require 'pry'

module Players
  class Computer < Player

    def opponent_player
      self.token == "X" ? Players::Computer.new("O") : Players::Computer.new("X")
    end

    def move(game)
      best_score = -2
      best_move = nil
      available_indices = game.board.cells.each_index.select {|i| game.board.cells[i] == " "}
      available_indices.each do |index|
        game.board.cells[index] = self.token
        score = minimax(game, self.opponent_player)
        game.board.cells[index] = " "
        if score > best_score
          best_score = score
          best_move = (index + 1).to_s
        end 
      end 
      best_move
    end 

    def minimax(game, player)
      if game.winner == player.token
        1
      elsif game.winner == player.opponent_player.token
        -1
      elsif game.draw?
        0
      else 
        available_indices = game.board.cells.each_index.select {|i| game.board.cells[i] == " "}

        if player == self
          value = -3.0/0.0
          available_indices.each do |index|
            game.board.cells[index] = player.token
            value = [value, minimax(game, player.opponent_player)].max
            game.board.cells[index] = " "
          end 
        else 
          value = 3.0/0.0
          available_indices.each do |index|
            game.board.cells[index] = player.token
            value = [value, minimax(game, player.opponent_player)].min
            game.board.cells[index] = " "
          end
        end 
        value
      end
    end 

  end 
end 