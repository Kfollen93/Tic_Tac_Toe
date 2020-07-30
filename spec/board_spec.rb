require './lib/board.rb'

describe Board do

    describe '#cords' do
        context 'when instructions are finished being displayed' do
        it 'initializes the empty board coordinates' do
            board = Board.new
            expect(board.cords).to eq(Array.new(3) { Array.new(3) { ' ' } })
        end
    end
end

    describe '#empty?' do
        context 'when there are still empty spaces' do
        it 'returns nil' do
            board = Board.new
            expect(board.empty?).to eq(nil)
        end
    end
end

    describe '#x_horizontal_win' do
        context 'when a horizontal row is filled with X' do
        it 'returns true' do
            board = Board.new
            board.cords[1][0], board.cords[1][1], board.cords[1][2] = 'X', 'X', 'X'
            expect(board.x_horizontal_win).to eq(true)
        end
    end
end

    describe '#x_vertical_win' do
        context 'when a vertical column is filled with X' do
        it 'returns true' do
            board = Board.new
            board.cords[0][0], board.cords[1][0], board.cords[2][0] = 'X', 'X', 'X'
            expect(board.x_vertical_win).to eq(true)
        end
    end
end

    describe '#x_diagonal_win' do
        context 'when a diagonal is filled with X' do
        it 'returns true' do
            board = Board.new
            board.cords[0][0], board.cords[1][1], board.cords[2][2] = 'X', 'X', 'X'
            expect(board.x_diagonal_win).to eq(true)
        end
    end
end

    describe '#declare_x_won' do
        context 'when X is filled three in a row/column/diagonal' do
        it 'displays name of X player' do
            win_phrase = "Mike wins!\n"
            board = Board.new
            allow(board).to receive(:starting_player) { 'Mike' }
            board.cords[1][0], board.cords[1][1], board.cords[1][2] = 'X', 'X', 'X'
            expect { board.declare_x_won }.to output(win_phrase).to_stdout
        end
    end
end
end
