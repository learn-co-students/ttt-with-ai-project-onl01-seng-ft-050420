require_relative '../player'

module Players
  class Computer < Player
    def move(board)
      new_board = nil
      # moves = moves(board, @token, true)
      max_moves = []
      
      moves.each do |key, value|
        max_moves << key if value == moves.values.max
      end
      move = max_moves.shuffle[0]
      return (move + 1).to_s
    end
  end
end