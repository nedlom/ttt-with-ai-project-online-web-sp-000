require 'pry'
module Players

  class Computer < Player
    
    WINS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
    def move(board)
      
      computer = self.token
      player = ""
      computer == "X" ? player = "O" : player = "X"
      
      x = WINS.detect do |win|
        a = win[0]
        b = win[1]
        c = win[2]
        d = [board.cells[a], board.cells[b], board.cells[c]]
        d.count(player) == 2 && d.count(" ") == 1
      end
      
      y = [0, 2, 6, 8].detect {|i| board.cells[i] == " "}
      
      if !x.nil?
        x.detect {|i| board.cells[i] == " "} + 1
      elsif board.cells[4] == " "
        5.to_s
      elsif !y.nil?
        y + 1
      else
        rand(1..9)
      end
    end
  end
end

