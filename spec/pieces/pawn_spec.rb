
require './lib/piece_lib/pawn'

describe Pawn do
  let(:pawn) { Pawn.new(:white,[1, 4]) }

  describe '#move' do
    context 'when a pawn is requested to move' do
      it 'on the first move it can move 2 spaces' do
        pawn.move([3,4])
        expect(pawn.location).to eql([3,4])
      end

      it 'on the second move it cannot move 2 places'do
        pawn.move([3,4])
        expect(pawn.move([5,4])).to (be false)
      end

      it 'if the move is illegal false is returned' do
        expect(pawn.move([2,3])).to (be false)
      end
    end
  end
end
