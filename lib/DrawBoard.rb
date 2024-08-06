require_relative 'Template' 

class DrawBoard 
  include FillTemplate
  attr_accessor :board, :turns_left, :game_finished
  def initialize 
    @board = Array.new(4, " ")   
    @turns_left = 12 
    @game_finished = false
  end 

  def draw_board
    display_board(@board)
  end   

  def guess_code(index, colour)  
    @board[index] = colour    
    draw_board
  end  
end  