# @Author: Alex Fultz <Fultzy>
# @Date:   19-Jul-2021
# @Filename: gamestate.rb
# @Last modified by:   big
# @Last modified time: 15-Oct-2021 (14:10)
# frozen_string_literal: true

require './lib/player'
require './lib/computer'
require './lib/board'
require 'json'

class Gamestate
  attr_accessor :turn_count, :game_over, :board

  def initialize(option1 = false, option2 = false, load = false)
    @game_over = false
    if load == false
      @turn_count = 1
      @player1 = if option1 == false
                   Computer.new('FooBot', :white)
                 else
                   Player.new('Foo', :white)
                 end
      @player2 = if option2 == false
                   Computer.new('BarBot', :black)
                 else
                   Player.new('Bar', :black)
                 end
      @board = Board.new
    else
      load_game
    end
  end

  #### Save/Load Game ####
  def save_game
    Dir.mkdir('saves') unless Dir.exist?('saves')
    data = {
      game: self,
      board: @board,
      player1: @player1,
      player2: @player2
    }
    File.open('saves/savefile.json', 'w') do |file|
      file.write(JSON.pretty_generate(data.to_json))
    end
    puts 'Game Saved! Thanks for playing!'
    exit
  end

  def load_game
    if File.exist?('saves/savefile.json')
      load('saves/savefile.json') do |file|
        data = JSON.parse(file)
        p data
        @board = data[board]
        @player1 = data[player1]
        @player2 = data[player2]
        @board.pieces = data[pieces]
        @board.graveyard = data[graveyard]
        puts 'Game Loaded!'
        @board.list_pieces
      end
    end
  end

  #### Game Flow ####
  def player
    @turn_count.odd? ? @player1 : @player2
  end

  def other_player
    @turn_count.odd? ? @player2 : @player1
  end

  # returns false for general invalid player inputs
  # work into case statments to include why invalid
  def legal_move?(input)
    return false if @board.pieces[input[0]].nil?
    return false if @board.pieces[input[0]].color == other_player.color

    # return false if @board.pieces.include?(input[1])
    # return false if @board.pieces[input[1]].color == player.color
    true
  end

  def turn
    @board.list_pieces
    @board.view
    input = player.makes_move
    if input == :save
      save_game
    else
      if legal_move?(input)
        @board.attack(input[0], input[1])
        @turn_count += 1
      else
        turn
      end
    end
  end
end
