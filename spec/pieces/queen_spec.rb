require './lib/pieces/queen'

describe Queen do
  before(:all) do
    @queen = Queen.new(:Black, [8,4])
    @list = @queen.list_moves
  end

  describe '#list_moves' do
    context 'when requesting a list of legal moves,' do
      subject { @queen.list_moves }
      it 'correctly generates a list with vertical moves avalible' do
        expect(subject).to include([2,4], [4,4], [6,4], [7,4])
      end

      it 'correctly generates a list with horizontal moves avalible' do
        expect(subject).to include([8,8], [8,6], [8,1], [8,0])
      end

      it 'correctly generates a list with ascending moves avalible' do
        expect(subject).to include([7,3], [6,2], [5,1], [4,0])
      end

      it 'correctly generates a list with descending moves avalible' do
        expect(subject).to include([7,5], [6,6], [5,7], [4,8])
      end
    end
  end

  describe '#move' do
    context 'When requested to move to a givin location,' do
      it 'if new location is legal the new location is saved' do
        @queen.move([4,3])
        expect(@queen.location).to eql([4,3])
      end

      it 'new location is returned after peice is moved' do
        expect(@queen.move([4,7])).to eql([4,7])
      end

      it 'returns false if new_location isnt in list of legal moves' do
        expect(@queen.move([8,8])).to (be false)
      end
    end
  end
end
