module Players
    class Human < Player

      def move(board = Board.new, game = nil)
        gets.chomp
      end

    end
  end
