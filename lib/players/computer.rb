require 'pry'
module Players

  class Computer < Player
    
    WIN_COMBINATIONS = [
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
      # find self's token
      # check the vector for two of the opposite token
      # fill the open space with self's token
      
      a = self.token
      b = ""
      if a == "X"
        b = "O"
      else
        b = "X"
      end
      
      if board.cells[4] == " "
        return 5.to_s
      end
        
      # binding.pry
      WIN_COMBINATIONS.each do |x|
        c = x[0]
        d = x[1]
        e = x[2]
        f = [board.cells[c], board.cells[d], board.cells[e]]
        if f.count(b) == 2 && f.count(" ") == 1
          g = f.find_index(" ")
          num = x[g] + 1
          return num.to_s
        end
      end
      rand(1..9).to_s
    end
  end
end
