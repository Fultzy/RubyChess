# frozen_string_literal: true

require './lib/gamestate'
load './lib/images/intro.rb'
# => intro has main menu on it

def main_menu
  print 'YoU pIcK NoW!: '
  case gets.chomp.to_i
  when 1 then @game = Gamestate.new(true, true)
  when 2 then @game = Gamestate.new(true)
  when 3 then @game = Gamestate.new
  when 4
    if Dir.exist?('saves')
      @game = Gamestate.new(false, false, true)
      @game.load_game
    else
      print "WrOnG! "
      main_menu
    end
  when nil || 5..9
    print "WrOnG! "
    main_menu
  end
end

p = 1
main_menu
load './lib/images/howplay.rb'
until @game.game_over == true
  puts ''
  @game.turn
end
puts ''

p 'Thanks for playing!'
