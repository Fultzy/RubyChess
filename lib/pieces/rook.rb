# frozen_string_literal: true

class Rook
  attr_reader :color, :location, :move_count, :value

  def initialize(color, location)
    @value = 5
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
  end

  # The rook can move only vertically and horizontally.
  # `@move_counter` exists for castling. castling is a
  # specal move, when neither the king and left/right side
  # rook have moved and the spaces between are free, youre
  # allowed to move the king two spaces towords one of the
  # rooks and place that rook on the other side of king.

  def list_moves(location = @location, list = [])
    list.push(*horizontal(location[0]))
    list.push(*vertical(location[1]))
    list
  end

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

  def move(new_location)
    if list_moves.include?(new_location)
      @move_count += 1
      @location = new_location
    else
      false
    end
  end
end
