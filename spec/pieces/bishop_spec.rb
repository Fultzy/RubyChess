# frozen_string_literal: true

require './lib/pieces/bishop'

describe Bishop do
  before(:all) do
    @bishop = Bishop.new(:Black, [8, 4])
  end

  describe '#list_moves' do
    context 'when requesting a list of legal moves,' do
      subject { @bishop.list_moves }
      it 'correctly generates a list with ascending moves avalible' do
        expect(subject).to include([7, 3], [6, 2], [5, 1], [4, 0])
      end

      it 'correctly generates a list with descending moves avalible' do
        expect(subject).to include([7, 5], [6, 6], [5, 7], [4, 8])
      end
    end
  end

  describe '#move' do
    context 'When requested to move to a givin location,' do
      it 'if new location is legal the new location is saved' do
        @bishop.move([6, 2])
        expect(@bishop.location).to eql([6, 2])
      end

      it 'new location is returned after peice is moved' do
        expect(@bishop.move([4, 4])).to eql([4, 4])
      end

      it 'returns false if new_location isnt in list of legal moves' do
        expect(@bishop.move([4, 5])).to(be false)
      end
    end
  end
end
