require './lib/pieces/rook'

describe Rook do
  before(:all) do
    @rook = Rook.new(:Black, [8,4])
  end

  describe '#list_moves' do
    context 'when requesting a list of legal moves,' do
      subject { @rook.list_moves }
      it 'correctly generates a list with vertical moves avalible' do
        expect(subject).to include([2,4], [4,4], [6,4], [7,4])
      end

      it 'correctly generates a list with horizontal moves avalible' do
        expect(subject).to include([8,8], [8,6], [8,1], [8,0])
      end
    end
  end

  describe '#move' do
    context 'When requested to move to a givin location,' do
      it 'if new location is legal the new location is saved' do
        @rook.move([4,4])
        expect(@rook.location).to eql([4,4])
      end

      it 'new location is returned after peice is moved' do
        expect(@rook.move([8,4])).to eql([8,4])
      end

      it 'returns false if new_location isnt in list of legal moves' do
        expect(@rook.move([7,7])).to (be false)
      end
    end
  end
end
