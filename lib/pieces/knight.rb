# @Author: Alex Fultz <Fultzy>
# @Date:   19-Jul-2021
# @Filename: knight.rb
# @Last modified by:   big
# @Last modified time: 14-Oct-2021 (12:10)
# frozen_string_literal: true

class Knight
  attr_reader :color, :location, :move_count, :value, :icon

  def initialize(color, location)
    @value = 3
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
    @icon = @color == :black ? '♘' : '♞'
  end

  # the knight can move to 8 different positions from a
  # givin location. `move_mod` is a list of modifyers, when
  # added to its [x, y] location the sum of each
  # represents all legal moves

  def list_moves(location = @location, list = [])
    move_mod = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    move_mod.each do |mod|
      list.push([location[0] + mod[0], location[1] + mod[1]])
    end
    list
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
