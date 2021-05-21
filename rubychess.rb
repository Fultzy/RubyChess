# frozen_string_literal: true

## Ruby chess created by Fultzy! :D
## ruby-v: 2.6.2
## likely using ruby2d-v: 0.9.5

require './lib/gamestate'
# require './lib/player.rb'
# require './lib/computer.rb'

# board size 8x8

# single player
# create game state & Board
@game = Gamestate.new

puts 'new knight created:'
@knight = Knight.new(:white, [2, 1])
puts ''

def get_to_here
  desired_square = [4, 4]
  until @knight.location == desired_square
    if @knight.list_moves.include?(desired_square)
      puts "knight to #{desired_square}"
      @knight.move(desired_square)
      @game.turn_tick
    else
      @knight.move(@knight.list_moves[rand(0...@knight.list_moves.size)])
      puts "knight to #{@knight.location}"
      @game.turn_tick
      get_to_here
    end
  end
end

puts ' list of moves'
p @knight.list_moves

get_to_here
puts "took you #{@game.turn_count} turns"
