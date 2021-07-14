# frozen_string_literal: true

class Queen
  attr_reader :color, :location, :move_count, :value, :icon

  def initialize(color, location)
    @value = 9
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
    @icon = @color == :black ? '♕' : '♛'
  end

  # the queen can move vertically, and horizontally any
  # number of spaces. it cannot jump over others, and
  # is the highest valued piece. when a pawn reaches the
  # other side of the board it is replaced with a queen

  def list_moves(location = @location, list = [])
    list.push(*horizontal(location[0]))
    list.push(*vertical(location[1]))
    list.push(*ascending(location))
    list.push(*descending(location))
    list
  end

  #### Path Finding ####
  def horizontal(x, y = 0, list = [])
    return list if y > 8

    list.push [x, y]
    horizontal(x, y + 1, list)
  end

  def vertical(y, x = 0, list = [])
    return list if x > 8

    list.push([x, y])
    vertical(y, x + 1, list)
  end

  def ascending(loc, list = [])
    return list if loc[0] > 8 || loc[1] > 8

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

  ###############
  def move(new_location)
    if list_moves.include?(new_location)
      @move_count += 1
      @location = new_location
    else
      false
    end
  end
end
