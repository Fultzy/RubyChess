# @Author: Alex Fultz <Fultzy>
# @Date:   19-Jul-2021
# @Filename: bishop.rb
# @Last modified by:   big
# @Last modified time: 15-Oct-2021 (15:10)
# frozen_string_literal: true

class Bishop
  attr_reader :color, :location, :move_count, :value, :icon

  def initialize(color, location)
    @value = 3
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
    @icon = @color == :black ? '♗' : '♝'
  end

  # The bishop can move like the queen but only
  # diagonally. ascending and descending methods
  # are the same as the queens.

  def list_moves(location = @location, list = [])
    list.push(*ascending(location))
    list.push(*descending(location))
  end

  def ascending(loc, list = [])
    return list if loc[0] > 7 || loc[1] > 8

    if list.empty?
      if loc[0] > loc[1]
        list.push([loc[0] - loc[1], 0])
        ascending([loc[0] - loc[1] + 1, 1], list)
      else
        list.push([loc[1] - loc[0], 0])
        ascending([loc[1] - loc[0] + 1, 1], list)
      end
    else
      list.push(loc)
      ascending([loc[0] + 1, loc[1] + 1], list)
    end
  end

  def descending(loc, list = [])
    return list if loc[0].negative? || loc[1] > 8

    if list.empty?
      until loc[0] == 8 || (loc[1]).zero?
        loc[0] += 1
        loc[1] -= 1
      end
      list.push(loc)
      descending([loc[0] - 1, loc[1] + 1], list)
    else
      list.push(loc)
      descending([loc[0] - 1, loc[1] + 1], list)
    end
  end

  def move(new_location)
    p list_moves
    p new_location
    list_moves.include?(new_location)
    if list_moves.include?(new_location)
      @move_count += 1
      @location = new_location
    else
      p "failed"
      false
    end
  end
end
