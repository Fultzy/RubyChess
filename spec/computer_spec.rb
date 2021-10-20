# frozen_string_literal: true

require './lib/computer'

describe Computer do
  before(:all) do
    @player = Computer.new('FooSpec', :black)
    # setup situation where low and high valued pieces can be taken
    # have computer choose highest value piece with lowest risk
  end

  describe '#can_check?' do
    context '' do
      xit 'text' do
        expect
      end
    end
  end

  describe '#can_attack?' do
    context '' do
      xit 'text' do
        expect
      end
    end
  end

  describe '#makes_move' do
    context '' do
      xit 'text' do
        expect
      end
    end
  end
end
