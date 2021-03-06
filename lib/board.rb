# @Author: Alex Fultz <Fultzy>
# @Date:   19-Jul-2021
# @Filename: board.rb
# @Last modified by:   big
# @Last modified time: 15-Oct-2021 (15:10)
# frozen_string_literal: true

require './lib/pieces/knight'
require './lib/pieces/pawn'
require './lib/pieces/bishop'
require './lib/pieces/rook'
require './lib/pieces/queen'
require './lib/pieces/king'

require 'json'

class Board
  attr_reader :pieces, :graveyard

  def initialize
    new_board
  end

  #### Game Setup ####
  def new_board
    # OH GOOD GOD WTF IS THIS?!?
    @graveyard = []
    @pieces = {
      [7, 0] => Rook.new(:black, [7, 0]),
      [7, 7] => Rook.new(:black, [7, 7]),
      [7, 1] => Knight.new(:black, [7, 1]),
      [7, 6] => Knight.new(:black, [7, 6]),
      [7, 2] => Bishop.new(:black, [7, 2]),
      [7, 5] => Bishop.new(:black, [7, 5]),
      [7, 3] => Queen.new(:black, [7, 3]),
      [7, 4] => King.new(:black, [7, 4]),
      [0, 0] => Rook.new(:white, [0, 0]),
      [0, 7] => Rook.new(:white, [0, 7]),
      [0, 1] => Knight.new(:white, [0, 1]),
      [0, 6] => Knight.new(:white, [0, 6]),
      [0, 2] => Bishop.new(:white, [0, 2]),
      [0, 5] => Bishop.new(:white, [0, 5]),
      [0, 4] => Queen.new(:white, [0, 4]),
      [0, 3] => King.new(:white, [0, 3])
    }
    y = 0
    until y == 8
      @pieces[[6, y]] = Pawn.new(:black, [6, y])
      @pieces[[1, y]] = Pawn.new(:white, [1, y])
      y += 1
    end
  end

  def list_pieces
    @pieces.each_value do |val|
      if val.class == Queen
        puts "#{val.icon} : #{val.class} @ #{val.location}/#{@pieces.key(val)}"
      elsif val.class == Bishop
        puts "#{val.icon} : #{val.class} @ #{val.location}/#{@pieces.key(val)}"

      end
    end
  end

  #### Piece Manipulation ####
  def remove(location, send_to_grave = false)
    if @pieces.include?(location)
      if send_to_grave == true
        @graveyard.push(@pieces[location])
        @pieces.delete(location)
      else
        @pieces.delete(location)
      end
    else
      false
    end
  end

  def replace(location, new_piece)
    @pieces[location] = new_piece if remove(location)
  end

  # @boards attack method checks if a piece is in the defending location
  # if there is it is removed and placed into graveyard
  # if not then the piece is placed into its new position and the hash
  # key renamed to its new location
  def attack(attacking, defending)
    if @pieces[defending].nil?

      @pieces[attacking].move(defending) ? @pieces[defending] = @pieces.delete(attacking) : false

      # prevents same color attacks
    elsif @pieces[defending].color != @pieces[attacking].color
      remove(defending, true)

      @pieces[attacking].move(defending) ? @pieces[defending] = @pieces.delete(attacking) : false
    else
      puts "    Invalid move detected"
      false
    end
  end
  #### Board ####
  def grave_icons(color)
    icons = String.new
    unless @graveyard.empty?
      @graveyard.each do |piece|
        icons.concat(piece.color == color ? piece.icon.to_s : '')
      end
    end
    icons
  end

  def grave_points(color)
    points = 0
    @graveyard.each do |piece|
      piece.color == color ? points += piece.value : next
    end
    points
  end

  # Generates a board and populates it according to each
  # piece location within @pieces hash(keys) and uses the above
  # methods to display points and graveyard icons to the side

  def view(line_count = 1, x = 7)
    sleep(0.008)
    return if line_count > 17
    if line_count == 1
      puts '   ???????????????????????????????????????????????????????????????????????????????????????????????????'
      view(line_count + 1, x)
    elsif line_count.odd? && line_count < 17
      puts '   ???????????????????????????????????????????????????????????????????????????????????????????????????'
      view(line_count + 1, x)
    elsif line_count == 17
      puts '   ???????????????????????????????????????????????????????????????????????????????????????????????????'
      puts '     A   B   C   D   E   F   G   H  '
    elsif line_count.even?
      piece_line(x, 0)
      view(line_count + 1, x - 1)
    end
  end

  def piece_line(x, y)
    print " #{x + 1} ???"
    until y == 8
      print @pieces.key?([x, y]) ? " #{@pieces[[x, y]].icon} ???" : '   ???'
      y += 1
    end
    print "    Bar: #{grave_points(:white)} point(s)" if x + 1 == 7
    print "    #{grave_icons(:white)}" if x + 1 == 6
    print "    Foo: #{grave_points(:black)} point(s)" if x + 1 == 2
    print "    #{grave_icons(:black)}" if x + 1 == 1
    puts ''
  end
end
