require_relative 'Template'
require 'colorize'
class DrawBoard
  include FillTemplate
  attr_accessor :board, :turns_left, :game_finished

  def initialize
    @board = Array.new(4, ' ')
    @turns_left = 12
    @game_finished = false
  end

  def draw_board
    display_board(@board.map { |color| colorize_string(color) })
  end

  def guess_code(index, colour)
    @board[index] = colour
    draw_board
  end

  def colorize_string(string)
    case string.downcase
    when 'red'
      string.colorize(:red)
    when 'orange'
      string.colorize(:light_red)
    when 'yellow'
      string.colorize(:yellow)
    when 'green'
      string.colorize(:green)
    when 'blue'
      string.colorize(:blue)
    when 'indigo'
      string.colorize(:light_blue)
    when 'violet'
      string.colorize(:magenta)
    when 'brown'
      string.colorize(:light_black)
    else
      string
    end
  end
end
