# @Author: Alex Fultz <big>
# @Date:   19-Jul-2021 (19:07)
# @Last modified by:   big
# @Last modified time: 15-Oct-2021 (15:10)


# frozen_string_literal: true

class Computer
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
    @move = 0
  end

  # => the computer class can be asked for inputs, it will at random move a piece with an avalible move.

  # => perhaps some favor to put player into check when avalible. `can_check` or `can_attack`

  # debug game
  def makes_move
    print @name + ': '
    # temp moves for computer vs computer
    white_commands = [
      'f2 to f3', 'e1 to h4', 'b1 to a3', 'e2 to e3', 'b2 to b4',
      '3a to 5b', 'f1 to 5b', '5b to 3d'
    ]

    black_commands = [
      '7b to 6b', '8c to 6a', 'e7 to e5', 'g8 to f6', '8f to 4b',
      '6a to b5', '7a to 6a'
    ]
    list = @color == :black ? black_commands : white_commands
    input = list[@move]
    sleep(0.2)
    print input
    attacking = lone_ranger(input.split(' to ')[0])
    defending = lone_ranger(input.split(' to ')[1])
    sleep(1.0)
    @move += 1
    [attacking, defending]
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

    if x.nil? || y.nil? || y.negative? || x.negative?
      puts 'out of range'
      false
    else
      [x, y]
    end
  end
end
