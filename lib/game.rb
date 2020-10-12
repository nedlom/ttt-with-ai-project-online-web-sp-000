require 'pry'
class Game
  
  attr_accessor :board, :player_1, :player_2
  
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
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      a = board.position(combo[0]+1)
      b = board.position(combo[1]+1)
      c = board.position(combo[2]+1)
      x_win = a == "X" && b == "X" && c == "X"
      o_win = a == "O" && b == "O" && c == "O"
      x_win || o_win
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    board.position(won?[0] + 1) if won?
  end
  
  def turn
    x = current_player.move(board)
    if !board.valid_move?(x)
      turn
    else
      board.update(x, current_player)
      board.display
    end
  end
  
  def play
    while !over?
      turn
    end
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end

end