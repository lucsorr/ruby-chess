require_relative 'board.rb'
require_relative 'ai.rb'
require_relative 'algebraic_conversion.rb'
require_relative './movement_rules/castling_rights.rb'

class Player
  include CastlingRights

  attr_accessor :last_move
  attr_reader :color, :board, :history

  def initialize(color, board)
    @color = color
    @board = board
    @history = []
  end

  private

  def maximizing_player?
    color == :white
  end
end

class Computer < Player
  include AI

  # depth: Levels of AI#minimax recursion. 
  # Deeper means harder (computer can think `depth` turns ahead)
  # See Engine#set_difficulty
  attr_accessor :depth

  def get_move
    computer_chooses_move
  end
end

class Human < Player
  include AlgebraicConversion  

  def get_move
    algebraic_input
  end
end
