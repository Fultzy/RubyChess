# frozen_string_literal: true

class Computer
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  # => the computer class can be asked for inputs, it will at random move a piece with an avalible move.

  # => perhaps some favor to put player into check when avalible. `can_check` or `can_attack`

  def makes_move
    
  end
end
