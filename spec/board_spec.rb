require './lib/board'

describe Board do
  before(:all) do
    @board = Board.new
    @piece_hash = @board.pieces
    @graveyard = @board.graveyard
  end

  describe '#new_board' do
    context 'when a new_board is requested' do
      it "creates a list containing 32 pieces" do
        expect(@piece_hash.size).to eql(34)
      end
    end
  end

  describe '#remove_piece' do
    context 'when called upon a location' do
      it "removes that piece if one is present" do
        expect(@board.remove([8, 0]).class).to (be Rook)
      end

      it "returns false if no piece is present" do
        expect(@board.remove([4, 4])).to (be false)
      end
    end

    context 'if being attacked / sent true value' do
      it "adds the removed piece to the graveyard" do
        @board.remove([8, 1], true)
        expect(@graveyard[0].class).to (be Knight)
      end
    end

    context 'when replacing a piece' do
      it "does not add it to the graveyard" do
        @board.remove([8, 2], false)
        expect(@graveyard[1].class).to_not (be Bishop)
      end
    end
  end

  describe '#attack' do
    context 'when a piece is requested to attack another' do
      xit "removes the defending piece from the board" do
        @board.attack()
        expect()
      end
      xit "changes the location of the attacking piece" do
        expect()
      end
      xit "returns false if no piece in attacking location" do
        expect()
      end
    end
  end
end
