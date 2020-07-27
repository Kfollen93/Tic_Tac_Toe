# frozen_string_literal: true

require_relative 'instructions'
require_relative 'player'

# Displays board and updates with move entries.
class Board
  attr_accessor :row_str, :column_str, :board_cords
  include Instructions

  def initialize
    @instructions = display_instructions
    @board = create_board
    @row_str = row_str
    @column_str = column_str
    @board_cords = board_cords
  end

  def create_board
    @board_cords = Array.new(3) { Array.new(3) { ' ' } }
    puts display_board(board_cords)
  end

  def display_board(array)
    <<~MYHEREDOC
      #{array[0]}
      #{array[1]}
      #{array[2]}
    MYHEREDOC
  end

  def enter_x_moves
    valid_move?
    @board_cords[@row][@column] = 'X'
    puts display_board(board_cords)
  end

  def enter_o_moves
    valid_move?
    @board_cords[@row][@column] = 'O'
    puts display_board(board_cords)
  end

  def valid_move?
    row_and_column
    until @row_str =~ /^[0-2]$/ && @column_str =~ /^[0-2]$/ && @board_cords[@row][@column] == ' '
      puts 'Not a valid move.'
      row_and_column
    end
  end

  def row_and_column
    @row_str = gets.chomp
    @column_str = gets.chomp
    @row = row_str.to_i
    @column = column_str.to_i
  end

  def announce_player1_turn
    if @player_one != @starting_player
      puts "    [^][^]     It's #{@player_one}'s turn!       [^][^]"
    else
      puts "   [^][^]     It's #{@player_two}'s turn!       [^][^]"
    end
  end

  def announce_player2_turn
    puts "    [^][^]     It's #{@starting_player}'s turn!       [^][^]"
  end

  def win_or_tie?
    x_win
    o_win
    empty?
  end

  def x_win
    if  board_cords.any? { |row| row.all? { |cell| cell == 'X' } } ||
        board_cords[0][0] == 'X' && board_cords[1][0] == 'X' && board_cords[2][0] == 'X' ||
        board_cords[0][1] == 'X' && board_cords[1][1] == 'X' && board_cords[2][1] == 'X' ||
        board_cords[0][2] == 'X' && board_cords[1][2] == 'X' && board_cords[2][2] == 'X' ||
        board_cords[0][0] == 'X' && board_cords[1][1] == 'X' && board_cords[2][2] == 'X' ||
        board_cords[2][0] == 'X' && board_cords[1][1] == 'X' && board_cords[0][2] == 'X'

      puts "#{@starting_player} wins!"
      exit
    end
  end

  def o_win
    if  board_cords.any? { |row| row.all? { |cell| cell == 'O' } } ||
        board_cords[0][0] == 'O' && board_cords[1][0] == 'O' && board_cords[2][0] == 'O' ||
        board_cords[0][1] == 'O' && board_cords[1][1] == 'O' && board_cords[2][1] == 'O' ||
        board_cords[0][2] == 'O' && board_cords[1][2] == 'O' && board_cords[2][2] == 'O' ||
        board_cords[0][0] == 'O' && board_cords[1][1] == 'O' && board_cords[2][2] == 'O' ||
        board_cords[2][0] == 'O' && board_cords[1][1] == 'O' && board_cords[0][2] == 'O'

      if @player_one != @starting_player
        puts "#{@player_one} wins!"
      else
        puts "#{@player_two} wins!"
      end
      exit
    end
  end

  def empty?
    spaces = board_cords.flatten.any? { |spot| spot == ' ' }
    if spaces == false
      puts 'Neither player wins. It\'s a tie.'
      exit
    end
  end
end
