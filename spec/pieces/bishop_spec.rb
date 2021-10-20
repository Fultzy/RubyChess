# @Author: Alex Fultz <big>
# @Date:   19-Jul-2021 (19:07)
# @Last modified by:   big
# @Last modified time: 15-Oct-2021 (15:10)


# frozen_string_literal: true

require './lib/pieces/bishop'

describe Bishop do
  before(:all) do
    @bishop = Bishop.new(:Black, [4, 4])
  end

  describe '#list_moves' do
    context 'when requesting a list of legal moves,' do
      subject { @bishop.list_moves }
      it 'correctly generates a list with ascending moves avalible' do
        expect(subject).to include([0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8])
      end

      it 'correctly generates a list with descending moves avalible' do
        expect(subject).to include([0, 8],[1, 7], [2, 6], [3, 5], [4, 4], [5, 3], [6, 2], [7, 1], [8, 0])
      end
    end
  end

  describe '#move' do
    context 'When requested to move to a givin location,' do
      it 'if new location is legal the new location is saved' do
        @bishop.move([6, 2])
        expect(@bishop.location).to eql([6, 2])
      end

      it 'can move back and up -debug'do
        expect(@bishop.move([8,0])). to eql([8,0])
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
