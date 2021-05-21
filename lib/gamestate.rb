
require './lib/piecelib/knight.rb'

# require './lib/player.rb'
# require './lib/computer/rb'
require './lib/board.rb'


class Gamestate

  attr_accessor :turn_count

  def initialize
    @turn_count = 0
    Board.new
    puts "Game Loaded"
  end

  def turn_tick
    @turn_count += 1
  end
end
