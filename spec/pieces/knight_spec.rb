# frozen_string_literal: true

require './lib/pieces/knight'

describe Knight do
  before(:all) do
    @knight = Knight.new(:white, [0, 1])
  end

  describe '#list_moves' do
    context 'when requesting a list of legal moves,' do
      it 'correctly generates a list of moves avalible' do
        expect(@knight.list_moves).to include([2, 2], [2, 0])
      end
    end
  end

  describe '#move' do
    context 'When requested to move to a givin location,' do
      it 'if new location is legal the new location is saved' do
        @knight.move([2, 2])
        expect(@knight.location).to eql([2, 2])
      end

      it 'new location is returned after peice is moved' do
        expect(@knight.move([4, 3])).to eql([4, 3])
      end

      it 'returns false if new_location isnt in list of legal moves' do
        expect(@knight.move([8, 8])).to(be false)
      end
    end
  end
end
