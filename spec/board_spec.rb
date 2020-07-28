require './lib/board.rb'

describe Board do

    describe '#board_cords' do
        context 'when instructions are finished being displayed'
        it 'initializes the empty board coordinates' do
            board = Board.new
            expect(board.board_cords).to eq(Array.new(3) { Array.new(3) { ' ' } })
        end
    end

=begin
    describe '#row_and_column' do
        it 'receives input of any type' do
            board = Board.new
            board.row_str = '1'
            expect(board.row).to eq('1')
        end
    end
=end
    describe '#enter_x_moves' do
    it 'checks if it is a valid move and enters X to board_cords if it is' do
        board = Board.new
        expect(board.enter_x_moves).to eq('X')
    end
end

end