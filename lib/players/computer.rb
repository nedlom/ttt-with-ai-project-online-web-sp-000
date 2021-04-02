require 'pry'
module Players

  class Computer < Player
    attr_reader :winning_cells
    
    def move(board)
      opponent_token = Player.all.detect {|p| p != self}.token
      
      near_win = Game.wins.detect do |win|
        @winning_cells = [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]]
        winning_cells.count(opponent_token) == 2 && winning_cells.count(" ") == 1
      end   
      
      open_corner = [0, 2, 6, 8].detect {|i| board.cells[i] == " "}
      binding.pry
      if near_win
        near_win[winning_cells.index(" ")] + 1
      elsif board.cells[4] == " "
        5
      elsif open_corner
        open_corner + 1
      else
        rand(1..9)
      end
    end
        
        
      
        
        # if !x.nil?
      #   x.detect {|i| board.cells[i] == " "} + 1
      # elsif board.cells[4] == " "
      #   5.to_s
      # elsif !y.nil?
      #   y + 1
      # else
      #   rand(1..9)
      # end
        
        
      
      # computer = self.token
      # player = ""
      # computer == "X" ? player = "O" : player = "X"
      
      #this detects a near win from player
      # checks win combos on board
      # if player is near win
      # returns that combo
      # and assigns it to variable x
      # near_win = Game.wins.detect do |win|
        #these are the winning indices in the array
        # a = win[0]
        # b = win[1]
        # c = win[2]
        # board.cells is the game_board_array 
        #d is the sub_array of the game_board_array
      #   winning_cells = [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]]
      #   winning_cells.count(opponent_token) == 2 && winning_cells.count(" ") == 1
      # end
      
      # binding.pry
      
      #detects an open corner on the TTT board
      # open_corner = [0, 2, 6, 8].detect {|i| board.cells[i] == " "}
      
      # if !x.nil?
      #   x.detect {|i| board.cells[i] == " "} + 1
      # elsif board.cells[4] == " "
      #   5.to_s
      # elsif !y.nil?
      #   y + 1
      # else
      #   rand(1..9)
      # end
    # end
  end
end

