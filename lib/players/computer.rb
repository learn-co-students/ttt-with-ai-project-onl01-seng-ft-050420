module Players
  class Computer < Player
  
    def move(board)
      rand(0..10).to_s
    end
  
  end
end