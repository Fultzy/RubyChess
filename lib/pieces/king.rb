class King
  attr_reader :color, :location, :move_count, :value

  def initialize(color, location)
    @value = 4
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
  end

  # The king can move in all dirrections but only one
  # space at a time. @move_counter` exists for castling.
  # castling is a specal move, when neither the king and left/
  # right side rook have moved and the spaces between are
  # free, youre allowed to move the king two spaces towords
  # one of the rooks and place that rook on the other side of king.


  def list_moves(_location = @location, list = [])
    move_mod = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
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
