class Board
  
  attr_accessor :cells
  
  WIN_COMBINATIONS = [  [0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [2,4,6] ]
  
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    return @cells[input.to_i - 1]
  end
  
  def full?
    return !@cells.include?(" ")
  end
  
  def turn_count
    return @cells.count {|x| x != " "}
  end
  
  def taken?(input)
    return @cells[input.to_i - 1] != " "
  end
  
  def valid_move?(input)
    return input.to_i > 0 && input.to_i < 10 && !taken?(input)
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if @cells[combo[0]] == @cells[combo[1]] && @cells[combo[1]] == @cells[combo[2]] && @cells[combo[0]] != " "
    end
    
    return false if full?
  end
  
  def winner
    if won? != nil
      return @cells[won?[0]]
    else
      return nil
    end
  end
  
end
