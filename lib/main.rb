require_relative 'board'
require_relative 'instructions'
board = Board.new

loop do
    board.enter_x_moves
    board.win_or_tie?
    board.announce_player1_turn
    board.enter_o_moves
    board.win_or_tie?
    board.announce_player2_turn
end