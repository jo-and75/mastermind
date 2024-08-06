require_relative 'DrawBoard'
require_relative 'Template'  

class HumanCodeMaker 
  include FillTemplate
  include GiveFeedback

  def initialize(board,computer)
    @colour_set = ["red","orange","yellow","green","blue","indigo","violet","brown"]
    @colour_code = Array.new(4, " ") 
    @board_drawer = board 
    @code_breaker = computer
    puts "Welcome, as code maker you are tasked with creating a four colour code the computer has to guess in 12 tries.\nAfter each guess, you have to give feedback on how many colours the computer got right and how many are in their accurate positions. Lets start" 
    colour_selection
  end 

  def colour_selection  
    loop do
      index = pick_index 
      colour = pick_colours(@colour_set)  
      create_code(index,colour)   
      if submit_guess(@colour_code)  
        loop do
          @code_breaker.generate_colour_set  
          code_comparison  
          break if @board_drawer.game_finished == true
        end  
         break
      end
    end
  end 

  def display_colour_code 
    display_board(@colour_code) 
  end 

  def create_code (index, colour)  
    @colour_code[index] = colour   
    display_colour_code 
  end   

  def code_comparison 
   accurate_guesses, same_positions = compare_arrays(@colour_code,@board_drawer.board) 
   give_feedback(accurate_guesses,same_positions)
  end 
end



