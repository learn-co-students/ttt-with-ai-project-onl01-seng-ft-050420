class Board
  attr_accessor :cells
  
  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    index = input.to_i - 1
    cells[index]
  end
  
  def full?
    cells.none?(" ")
  end
  
  def turn_count
    cells.count do |token| 
      token == "X" || token == "O"
    end
  end
  
  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O" ? true : false
  end
  
  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9) ? true: false
  end
  
  def update(input, player)
    cells[input.to_i - 1] = player.token
  end
  
end