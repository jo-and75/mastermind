require_relative 'DrawBoard' 
require_relative 'HumanCodeMaker'
class Computer  
  attr_accessor :code_set
  def initialize(board_drawer)
    @colour_array = ["red","orange","yellow","green","blue","indigo","violet","brown"] 
    @draw_board = board_drawer 
  end

  def generate_colour_set  
    @i = 0
    loop do
      element = @colour_array.shuffle.pop  
      if @draw_board.board.include?(element) == false 
        @draw_board.guess_code(@i,element) 
        @i += 1
        break if !@draw_board.board.include?(" ") 
      end
    end 
    # puts @draw_board.draw_board 

  end
end 

