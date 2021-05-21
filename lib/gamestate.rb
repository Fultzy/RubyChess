# frozen_string_literal: true

require './lib/piecelib/knight'

# require './lib/player.rb'
# require './lib/computer/rb'
require './lib/board'

class Gamestate
  attr_accessor :turn_count

  def initialize
    @turn_count = 0
    Board.new
    puts 'Game Loaded'
  end

  def turn_tick
    @turn_count += 1
  end
end
