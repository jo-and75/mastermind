module FillTemplate
  def display_board(board)
    puts "|#{board[0]}|#{board[1]}|#{board[2]}|#{board[3]}|"
  end

  def pick_index
    loop do
      print 'Please select a number(1-4) to place your colour in your colour code: '
      index_pick = gets.strip.to_i
      if index_pick.between?(1, 4)
        return index_pick -= 1
        break
      else
        puts 'Invalid input'
      end
    end
  end

  def pick_colours(colour_set)
    loop do
      print 'Please select a colour from the colour set: '
      colour_choice = gets.downcase.strip!
      if colour_set.include?(colour_choice)
        return colour_choice
        break
      else
        puts 'Invalid input'
      end
    end
  end

  def submit_guess(colour_set)
    return unless !colour_set.include?(' ') && colour_set.size == colour_set.uniq.size

    print 'Guessing template complete, if you would like to submit your guesses, type YES. If you would like to continue editing, type NO: '
    answer = gets.upcase.strip!
    return true if answer == 'YES'

    false
  end
end

module GiveFeedback
  def compare_arrays(array_1, array_2)
    accurate_guesses = []
    same_positions = []

    array_1.each_with_index do |element, index|
      array_2.each_with_index do |element1, index1|
        next unless element == element1

        accurate_guesses << element1
        same_positions << element1 if index == index1
      end
    end
    [accurate_guesses, same_positions]
  end

  def give_feedback(accurate_guesses, same_positions)
    @board_drawer.turns_left -= 1
    if same_positions.length == 4
      puts 'Your submitted set matches the colour code. YOU WIN!!!'
      @board_drawer.game_finished = true
    elsif @board_drawer.turns_left > 0
      if accurate_guesses.length == 0
        puts "Your submitted set doesn't match the colour code as none of the colours you have picked are in the code maker's set.\nYou have #{@board_drawer.turns_left} turns left. Please try again. "
      elsif accurate_guesses.length >= 1
        puts "Your submitted set doesn't quite match the colour code.
        #{accurate_guesses.length} colour(s) you chose are in the codemakers set.
        #{same_positions.length} colour(s) you chose are in their correct positions.\nYou have #{@board_drawer.turns_left} turns left. Please try again."
      end
    elsif @board_drawer.turns_left == 0
      puts 'You failed to decipher the code in 12 turns. YOU LOSE :('
      @board_drawer.game_finished = true
    end
  end
end

module GameInstructions
  def code_breaker_instructions
    puts " Colour set: [red,orange,yellow,green,blue,indigo,violet]

    GAME INSTRUCTIONS
    1. The code maker has developed a set of four colors from the same set of colors you have been given.
    2. As the code breaker, your objective is to accurately guess the colors the code maker picked and their exact positions in the set.
    3. You are entitled to 12 guessing rounds.
    4. After each round, you will receive feedback from the code maker informing you which of your color picks were accurate and how many are in the correct position.
    5. Crack the code before your guesses run out, and you'll win, or else...

                      BEST OF LUCK!!!
      "
  end
end
