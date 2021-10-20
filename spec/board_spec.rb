# @Author: Alex Fultz <big>
# @Date:   19-Jul-2021 (19:07)
# @Last modified by:   big
# @Last modified time: 14-Oct-2021 (12:10)


# frozen_string_literal: true

require './lib/board'

describe Board do
  before(:each) do
    @board = Board.new
    @pieces = @board.pieces
    @graveyard = @board.graveyard
  end

  describe '#new_board' do
    context 'when a new_board is requested' do
      it 'creates a list containing 32 pieces' do
        expect(@pieces.size).to eql(32)
      end
    end
  end

  describe '#remove' do
    context 'when called upon a location' do
      it 'removes that piece if one is present' do
        expect(@board.remove([7, 0]).class).to(be Rook)
      end

      it 'returns false if no piece is present' do
        expect(@board.remove([4, 4])).to(be false)
      end
    end

    context 'if being removed with true value' do
      it 'adds the removed piece to the graveyard' do
        @board.remove([7, 1], true)
        expect(@graveyard[0].class).to(be Knight)
      end
    end

    context 'if being removed with false or no boolean' do
      it 'does not add it to the graveyard' do
        @board.remove([7, 2], false)
        expect(@graveyard[1].class).to_not(be Bishop)
      end
    end
  end

  describe '#attack' do
    context 'when a piece is requested to attack another' do
      it 'removes the defending piece from the board' do
        @pieces[[4, 4]] = Rook.new(:black, [4, 4])
        @pieces[[4, 2]] = Rook.new(:white, [4, 2])
        @board.attack([4, 2], [4, 4])
        expect(@graveyard).to include(Rook)
      end

      it 'changes the location of the attacking piece' do
        @board.attack([1, 3], [2, 3])
        expect(@pieces[[2, 3]]).to be_a(Pawn)
      end

      it 'returns false when both pieces are same color' do
        expect(@board.attack([1, 1], [1, 2])).to (be false)
      end
    end
  end

  describe '#grave_icons ' do
    context 'returns icons of pieces in graveyard' do
      it 'when looking for :black pieces' do
        @board.remove([7, 1], true)
        @board.remove([7, 0], true)
        expect(@board.grave_icons(:black)).to eql('♘♖')
      end

      it 'when looking for :white pieces' do
        @board.remove([0, 4], true)
        @board.remove([0, 7], true)
        expect(@board.grave_icons(:white)).to include('♛♜')
      end
    end
  end

  describe '#grave_points' do
    context 'returns sum of piece values within graveyard' do
      it 'when looking at :black pieces' do
        @board.remove([7, 1], true)
        @board.remove([7, 0], true)
        expect(@board.grave_points(:black)).to eql(8)
      end

      it 'when looking for :white pieces' do
        @board.remove([0, 4], true)
        @board.remove([0, 7], true)
        expect(@board.grave_points(:white)).to eql(14)
      end
    end
  end
  describe '#check_mate?' do
    context '' do
      xit 'text' do
        expect
      end
    end
  end

  describe '#check?' do
    context '' do
      xit 'text' do
        expect
      end
    end
  end
end
