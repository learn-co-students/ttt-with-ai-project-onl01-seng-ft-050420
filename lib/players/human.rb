class Player::Human < Player
  def move(board, timer = 0)
    puts "Please enter 1-9:"
    gets.chomp
  end
end

module Players
  class Human < Player

    def move(board)
      input = gets.strip
    end
  end
end