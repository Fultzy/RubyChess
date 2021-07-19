# frozen_string_literal: true

class Player
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def makes_move
    puts 'Enter your next move!'
    print "#{@name}: "
    input = gets.chomp.downcase.strip
    if input == 'save'
      :save
    else
      attacking = lone_ranger(input.split(' to ')[0])
      defending = lone_ranger(input.split(' to ')[1])
      [attacking, defending]
    end
  end

  def lone_ranger(location)
    range = 'a'..'h'
    if range.include?(location[0])
      y = range.to_a.index(location[0])
      x = location[1].to_i - 1
    else
      y = range.to_a.index(location[1])
      x = location[0].to_i - 1
    end
    [x, y]
  end
end
