require 'pry'

module Players
  class Computer < Player

    def move(board)
        available_moves = board.cells.each_index.select{|i| board.cells[i] == ' '}
        (available_moves[0]+1).to_s
    end

  end
end
