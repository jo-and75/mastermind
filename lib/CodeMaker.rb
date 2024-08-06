require_relative 'DrawBoard' 

class CodeMaker   
  include GiveFeedback 
  attr_accessor :code 
  def initialize(board_drawer) 
    @colours = ["red","orange","yellow","green","blue","indigo","violet","brown"] 
    @code = []  
    @board_drawer = board_drawer  
    generate_code 
  end

  def generate_code   
    loop do
     element = @colours.shuffle.pop  
      if @code.include?(element) == false 
        @code << element  
        break if @code.length == 4 
      end
    end 
    # puts  @code 
  end 

  def arr_comparison
    accurate_guesses, same_positions = compare_arrays(@code,@board_drawer.board)   
     @board_drawer.draw_board
    give_feedback(accurate_guesses,same_positions) 
  end  
end  