class Pawn
  attr_reader :color, :location, :move_count, :value

  def initialize(color, location)
    @value = 1
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
  end

  # on the pawns first move its allowed to move 2
  # spaces. it cannot move side to side, and cannot
  # move backwords. the :color decides in which
  # direction it travels

  def list_moves(location = @location)
    case @color
    when :black
      if @move_count == 0
        [ [location[0] - 1, location[1]],
        [location[0] - 2, location[1]]]
      else
        [[location[0] - 1, location[1]]]
      end
    when :white
      if @move_count == 0
        [ [location[0] + 1, location[1]],
        [location[0] + 2, location[1]]]
      else
        [[location[0] + 1, location[1]]]
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
