# frozen_string_literal: true

require './lib/player'
require './lib/computer'
require './lib/board'
require 'json'

class Gamestate
  attr_accessor :turn_count, :game_over, :board

  def initialize(option1 = false, option2 = false)
    @turn_count = 1
    @game_over = false
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
    File.open("saves/savefile.json", 'w') do |file|
      file.write(JSON.pretty_generate(data.to_json))
    end
    puts 'Game Saved!'
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

  #### SetUp ####
  def new_game?; end

  #### Game Flow ####
  def player
    @turn_count.odd? ? @player1 : @player2
  end

  def turn
    @board.view
    #player.makes_move
    #@board.check?
    @turn_count += 1
  end
end
