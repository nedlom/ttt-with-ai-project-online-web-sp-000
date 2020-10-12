require 'pry'

class Board
  
  attr_accessor :cells
  
  def reset!
    self.cells = Array.new(9, " ")
  end
  
  def initialize
    reset!
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
    cells.all?{|x| x == "X" || x == "O"}
  end
  
  def turn_count
    cells.count{|x| x == "X" || x == "O"}
  end
  
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
  
  def valid_move?(index)
    !taken?(index) && index.to_i.between?(1, 9)
  end
  
  def update(input, player)
    index = input.to_i - 1
    cells[index] = player.token
  end
  
end