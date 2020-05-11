require 'pry'

class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end 

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def update(input, player)
    @cells[input.to_i - 1]= player.token
  end
  
  def full?
    !@cells.any?{|cell| cell == " "}
  end

  def turn_count
    @cells.count{|cell| cell != " "}
  end

  def taken?(input)
    self.position(input) != " "
  end 

  def valid_move?(input)
    (1..9).to_a.include?(input.to_i) && !self.taken?(input)
  end

end 