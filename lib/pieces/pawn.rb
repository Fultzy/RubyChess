# @Author: Alex Fultz <Fultzy>
# @Date:   19-Jul-2021
# @Filename: pawn.rb
# @Last modified by:   big
# @Last modified time: 14-Oct-2021 (14:10)
# frozen_string_literal: true

class Pawn
  attr_reader :color, :location, :move_count, :value, :icon

  def initialize(color, location)
    @value = 1
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
    @icon = @color == :black ? '♙' : '♟︎'
  end

  # on the pawns first move its allowed to move 2
  # spaces. it cannot move side to side, and cannot
  # move backwords. the :color decides in which
  # direction it travels

  def list_moves(location = @location, list = [])
    case @color
    when :black
      if @move_count.zero?
        list.push([location[0] - 1, location[1]],
                  [location[0] - 2, location[1]])
      else
        list.push([location[0] - 1, location[1]])
      end

    when :white
      if @move_count.zero?
        list.push([location[0] + 1, location[1]],
                  [location[0] + 2, location[1]])
      else
        list.push([location[0] + 1, location[1]])
      end
    end
  end

  def move(new_location)
    if list_moves.include?(new_location)
      @move_count += 1
      @location = new_location
    else
      false
    end
  end
end
