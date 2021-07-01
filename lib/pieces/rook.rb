class Rook
  attr_reader :color, :location, :move_count, :value

  def initialize(color, location)
    @value = 5
    @color = color
    @location = location # => [x,y] or [^,>]
    @move_count = 0
  end

  def list_moves(_location = @location)

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
