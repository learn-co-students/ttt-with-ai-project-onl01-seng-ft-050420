require 'pry'
module Players
  
  class Human < Player #player.new has a token
  
    def move(board)
      puts "Please enter 1-9:"
      gets.strip
    end
  
  end

end
