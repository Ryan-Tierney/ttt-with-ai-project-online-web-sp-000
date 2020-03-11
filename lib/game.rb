class Game
  
  attr_accessor :board, :player_1, :player_2
  
    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @board.display
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
  def current_player 
    board.turn_count.odd? ? player_2 : player_1
  end 
  
  def won? 
    WIN_COMBINATIONS.each do |combination| 
       if @board.cells[combination[0]] == @board.cells[combination[1]] &&
          @board.cells[combination[1]] == @board.cells[combination[2]] &&
          @board.taken?(combination[0]+1)
      return combination
    end 
  end 
  return false 
end 

def draw? 
  if board.full? && !won?
    true 
  else 
    false 
  end 
end 

def over?
end 
end 