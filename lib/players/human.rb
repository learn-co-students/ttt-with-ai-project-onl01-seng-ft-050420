module Players
  class Human < Player

    def move(board = Board.new)
      gets.chomp
    end 

  end 
end 