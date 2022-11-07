require_relative 'board.rb'
require_relative 'ai.rb'
require_relative 'user_input.rb'
require_relative 'castling.rb'


require 'pry'

class Player
  include Castling

  attr_reader :color, :board

  def initialize(color, board)
    @color = color
    @board = board
  end
end

class Computer < Player
  include AI

  def get_position
    computer_chooses_movement
  end
end

class Human < Player
  include UserInput
  
  def get_position
    algebraic_input
  end
end
