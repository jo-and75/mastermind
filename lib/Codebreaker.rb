require_relative 'DrawBoard' 
require_relative 'CodeMaker'
require_relative 'Template' 

class CodeBreaker    
  include FillTemplate 
  include GameInstructions
  def initialize(board_drawer,code_maker)
    @board_drawer = board_drawer
    @code_maker = code_maker 
    # parameter added to ensure CodeMaker and CodeBreaker use same instance of DrawBoard
    @colour_set = ["red","orange","yellow","green","blue","indigo","violet","brown"]    
  end   

  def colour_selection 
    index = pick_index 
    colour = pick_colours(@colour_set)  
    @board_drawer.guess_code(index,colour) 
    if submit_guess(@board_drawer.board)  
      @code_maker.arr_comparison
    end 
  end 

  def display_colour_code 
    display_board(@colour_code) 
  end 
end  
