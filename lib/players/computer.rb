require 'pry'

module Players
  class Computer < Player

    def move(board = Board.new, game = Game.new)
      best_score = -3.0/0.0
      available_indices = board.cells.each_index.select {|i| board.cells[i] == " "}
      available_indices.each do |index|
        input = (index + 1).to_s
        board.update(input, self)
        score = minimax(board.cells, 0, false, game)
        board.cells[index] = " "
        if (score > best_score)
          best_score = score
          return input
        end 
      end 
    end

    scores = {
    }

    def minimax(cells, depth, is_maximizing?, game)
      if (game.winner != nil) do
        game.winner == self.token ? 1 : -1
      end

      if (is_maximizing?) do 
        best_score = -3.0/0.0
        available_indices = board.cells.each_index.select {|i| board.cells[i] == " "}
        available_indices.each do |index|
          input = (index + 1).to_s
          board.update(input, self)
          score = minimax(board.cells, depth + 1, false, game)
          board.cells[index] = " "
          best_score = [score, best_score].max
        end 
      else 
        best_score = 3.0/0.0
        available_indices = board.cells.each_index.select {|i| board.cells[i] == " "}
        available_indices.each do |index|
          input = (index + 1).to_s
          board.update(input, self)
          score = minimax(board.cells, depth + 1, false, game)
          board.cells[index] = " "
          best_score = [score, best_score].max
        end 

  end 
end 