# frozen_string_literal: true

class Player
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def makes_move
    puts 'select a piece to move and where to move it'
    print "#{@name}: "
    input = gets.chomp.downcase
  end
end
