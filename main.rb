require_relative 'DrawBoard'
require_relative 'CodeMaker' 
require_relative 'CodeBreaker'  
require_relative 'Template'

require_relative 'DrawBoard'
require_relative 'HumanCodeMaker' 
require_relative 'Computer' 

class GameManager    
  include GameInstructions
  attr_accessor :turns_left
  def initialize  
    @board_drawer = DrawBoard.new
    @code_maker = CodeMaker.new(@board_drawer) 
    @code_breaker = CodeBreaker.new(@board_drawer, @code_maker)
    play_game
  end  

  def play_game    
    code_breaker_instructions
    loop do 
      @code_breaker.colour_selection
      if @board_drawer.game_finished 
      puts "The code set was: #{@code_maker.code }"  
        break  
      end
    end 
  end
end

class Game 
  def initialize  
    @board_drawer = DrawBoard.new 
    @computer = Computer.new(@board_drawer)
    @human_code_maker = HumanCodeMaker.new(@board_drawer,@computer) 
  end  
end   

print "Welcome to my mastermind, if you would like to be the codemaker, type 1. If you would like to be the codebreaker\npress 2: " 
loop do
  user_input = gets.strip!.to_i 
  if user_input == 1 
    code_maker = Game.new  
    break
  elsif user_input == 2 
    code_breaker = GameManager.new 
    break
  else 
    puts "Invalid input" 
  end 
end
