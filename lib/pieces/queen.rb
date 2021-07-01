class Queen
  attr_reader :color, :location, :move_count, :value

  def initialize(color, location)
    @value = 9
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
  end

  # the queen can move vertically, and horizontally any
  # number of spaces.

  def list_moves(location = @location, list = [])
    list.push(*horizontal(location[0]))
    list.push(*vertical(location[1]))
    list.push(*ascending(location))
    list.push(*descending(location))
    list
  end

  def horizontal(x, y = 0, list = [])
    return list if y > 8
    list.push [x,y]
    horizontal(x, y + 1, list)
  end

  def vertical(y, x = 0, list = [])
    return list if x > 8
    list.push([x,y])
    vertical(y, x + 1, list)
  end

  def ascending(location, list = [])
    return list if location[0] > 8 || location[1] > 0
    if list.empty?


    else

    end
  end

  def descending(location, list = [])
    if list.empty?

    else

    end
  end

  # should do helper recursive method?
  # make single implements for directions
  # add them to other pieces, king like
  # queen but one space cap.

  def move(new_location)
    if list_moves.include?(new_location)
      @move_count += 1
      @location = new_location
    else
      false
    end
  end
end
