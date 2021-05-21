
class Knight
  attr_reader :color, :location


  def initialize(color, location)
    @value = 3
    @color = color
    @location = location
  end

  def list_moves(location = @location)
    movelist = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
    range = 1...8
    array = Array.new
    movelist.each do |x, y|
      new_x = x + location[0]
      new_y = y + location[1]
      range.include?(new_x) && range.include?(new_y) ? array.push([new_x, new_y]) : nil
    end
    array.compact.shuffle
  end

  def move(new_location)
    list_moves.include?(new_location) ? @location = new_location : false
    return true
  end
end
