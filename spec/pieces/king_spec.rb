
require './lib/pieces/king'

describe King do
  before(:all) do
    @king = King.new(:white, [0,4])
  end

  describe '#list_moves' do
    context 'when requesting a list of legal moves,' do
      it 'correctly generates a list of moves avalible' do
        expect(@king.list_moves).to include([1, 4], [1, 3], [1, 5], [0, 3], [0, 5])
      end
    end
  end

  describe '#move' do
    context 'When requested to move to a givin location,' do
      it 'if new location is legal the new location is saved' do
        @king.move([1, 4])
        expect(@king.location).to eql([1, 4])
      end

      it 'new location is returned after peice is moved' do
        expect(@king.move([2, 4])).to eql([2, 4])
      end

      it 'returns false if new_location isnt in list of legal moves' do
        expect(@king.move([8, 8])).to(be false)
      end
    end
  end
end
